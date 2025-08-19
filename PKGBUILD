# Maintainer: silverhikari <kerrickethan@gmail.com>
pkgname=onscripter-en-devkit-git
_pkgname=ONScripter-EN-devkit
pkgver=r41.e6e76bc
pkgrel=2
pkgdesc="devkit for use with ONScripter-EN"
arch=('x86_64')
url="https://github.com/Galladite27/ONScripter-EN-devkit"
license=('nonfree')
depends=('onscripter-en-galladite27')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/Galladite27/ONScripter-EN-devkit")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${_pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${_pkgname%-git}"
	install -d "${pkgdir}/usr/share/doc/ONScripter-EN-devkit/html/"
	cp -r * -t "${pkgdir}/usr/share/doc/ONScripter-EN-devkit/html/"

	#removing uneeded files
	rm -rv "${pkgdir}/usr/share/doc/ONScripter-EN-devkit/html/resources/engine"
	rm -v "${pkgdir}/usr/share/doc/ONScripter-EN-devkit/html/resources/tools/onscrtools-win32-20100915.zip"
	rm -v "${pkgdir}/usr/share/doc/ONScripter-EN-devkit/html/resources/tools/onscrtools-mac-20100915.dmg"
}
