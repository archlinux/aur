# Maintainer: Silas Henrique <silash35@gmail.com>
pkgname=qpdftools
pkgver=2.0
pkgrel=0
epoch=0
pkgdesc="Qpdf Tools is an easy-to-use Qt interface for Ghostscript and QPDF"
arch=(x86_64)
url="https://github.com/silash35/qpdftools"
license=('Unlicense')
depends=('ghostscript' 'qpdf' 'qt5-base' 'qt5-svg' 'breeze-icons')
makedepends=('git' 'cmake')
provides=('qpdftools')
conflicts=('qpdftools-git')

source=("https://github.com/silash35/qpdftools/archive/v$pkgver.tar.gz")
md5sums=('3220ae72d82e25146603e3d341b1f391')

build() {
	cd qpdftools-$pkgver
	cmake -DCMAKE_BUILD_TYPE=Release .
	make
}

package() {
	cd qpdftools-$pkgver
	make DESTDIR="$pkgdir/" install
}
