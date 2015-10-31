# Maintainer: Johannes Donath <johannesd@torchmind.com>
pkgname=('webify')
pkgdesc="webfont generator - converts ttf to woff, eot and svg"
url="https://github.com/ananthakumaran/webify"
license=('MIT')
pkgver=0.1.7.0
pkgrel=1
arch=('i686' 'x86_64')
depends=('zlib' 'libffi' 'gmp')
source=('LICENSE')
source_i686=('https://github.com/ananthakumaran/webify/releases/download/0.1.7.0/webify-linux-x86_32')
source_x86_64=('https://github.com/ananthakumaran/webify/releases/download/0.1.7.0/webify-linux-x86_64')
md5sums=('aabfb78191314e2b916dddac818da678')
md5sums_i686=('2b61c12e9add6a5f47c688c90073ddc0')
md5sums_x86_64=('75e1660050dd88153231945c16e32cb3')

package() {
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	if [ "${CARCH}" = "i686" ]; then
		install -D -m755 webify-linux-x86_32 "${pkgdir}/usr/bin/webify"
	else
		install -D -m755 webify-linux-x86_64 "${pkgdir}/usr/bin/webify"
	fi
}
