# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=vtf-thumbnailer-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="Adds previews for VTF files in your file explorer of choice on Windows and Linux."
arch=('x86_64')
url="https://github.com/craftablescience/vtf-thumbnailer"
license=('MIT')
depends=('glibc' 'gcc-libs')
provides=(${pkgname::-4})
conflicts=(${pkgname::-4})
source=("$url/releases/download/v${pkgver}/VTF-Thumbnailer-${pkgver}-Linux.rpm")
sha256sums=('cdbca40ff1f1ca668692770054645e4708111ca7884c9db0561b021e5f34cff8')
validpgpkeys=()

package() {
	cd "$srcdir"
	install -Dm755 "$srcdir/opt/${pkgname::-4}/${pkgname::-4}" "$pkgdir/usr/lib/${pkgname::-4}/${pkgname::-4}"
	install -Dm644 "$srcdir/usr/share/mime/packages/${pkgname::-4}.xml" "$pkgdir/usr/share/mime/packages/${pkgname::-4}.xml"
	install -Dm644 "$srcdir/usr/share/thumbnailers/${pkgname::-4}.thumbnailer" "$pkgdir/usr/share/thumbnailers/${pkgname::-4}.thumbnailer"
	sed -i 's/\/opt/\/usr\/lib/g' "$pkgdir/usr/share/thumbnailers/${pkgname::-4}.thumbnailer"
}
