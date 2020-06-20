# Maintainer: Silas Henrique <silash35@gmail.com>
pkgname=qpdftools
pkgver=1.3
pkgrel=1
epoch=0
pkgdesc="Qpdf Tools is an easy-to-use Qt interface for Ghostscript and Stapler"
arch=(x86_64)
url="https://github.com/silash35/qpdftools"
license=('Unlicense')
depends=('ghostscript' 'stapler' 'qt5-base' 'qt5-svg' 'breeze-icons')
makedepends=('git')
provides=(qpdftools)

prepare() {
	git clone https://github.com/silash35/qpdftools.git
}

build() {
	cd qpdftools
	cmake .
	make
}

package() {
	cd qpdftools
	make DESTDIR="$pkgdir/" install
}
