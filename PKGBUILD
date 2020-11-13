# Maintainer: ROllerozxa (temporaryemail4meh [gee mail])
pkgname=apksigner
pkgver=1.9
pkgrel=1
pkgdesc="command line tool to sign and verify Android APKs (from Debian)"
arch=(any)
url="https://android.googlesource.com/platform/tools/apksig"
license=('apache')
depends=('java-runtime' 'bash')
source=("apksigner.deb::http://ftp.debian.org/debian/pool/main/a/android-platform-tools-apksig/apksigner_0.9-1~bpo10+1_all.deb"
		"apksigner")
sha256sums=("bea36248d31a517f3cf606ae0c537688c5be16fd16851014651c5a880e54097c"
		"2667306bc9c26b7896413cdd59622d488950cef88c0f9bf6dff0bf571274c13b")

package() {
	7z x "data.tar.xz"
	7z x "data.tar" -o"${pkgdir}"

	rm "${pkgdir}/usr/bin/apksigner"
	install -Dm755 "${srcdir}/apksigner" "${pkgdir}/usr/bin/apksigner"

	find "${pkgdir}" -type d -execdir chmod 755 {} +
}
