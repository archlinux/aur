# Maintainer: Silas Henrique <silash35@gmail.com>
pkgname=qpdftools
pkgver=1.4
pkgrel=1
epoch=0
pkgdesc="Qpdf Tools is an easy-to-use Qt interface for Ghostscript and Stapler"
arch=(x86_64)
url="https://github.com/silash35/qpdftools"
license=('Unlicense')
depends=('ghostscript' 'stapler' 'qt5-base' 'qt5-svg' 'breeze-icons')
makedepends=('git')
provides=('qpdftools')
conflicts=('qpdftools-git')

source=("https://github.com/silash35/qpdftools/archive/v$pkgver.tar.gz")
md5sums=('a1b92464530b54fb87646ddf25105532')

build() {
	cd qpdftools-$pkgver
	cmake .
	make
}

package() {
	cd qpdftools-$pkgver
	make DESTDIR="$pkgdir/" install
}
