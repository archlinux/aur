# Maintainer: Silas Henrique <silash35@gmail.com>
pkgname=qpdftools
pkgver=2.0.2
pkgrel=0
epoch=0
pkgdesc="Qpdf Tools is an easy-to-use Qt interface for Ghostscript and QPDF"
arch=(x86_64)
url="https://github.com/silash35/qpdftools"
license=('Unlicense')
depends=('ghostscript' 'qpdf' 'qt5-base' 'qt5-svg' 'breeze-icons')
makedepends=('git' 'cmake' 'extra-cmake-modules' 'qt5-tools')
provides=('qpdftools')
conflicts=('qpdftools-git')

source=("https://github.com/silash35/qpdftools/archive/v$pkgver.tar.gz")
md5sums=('feb8c973cd2980613f2d66ee44002eac')
sha512sums=('c84d04d82384b777603f8891be7c570b6f9f80e2dd73c9a987bd852fd0974197cb897bf7700b7a746cc5658b97e1fb62ffece211d9e5962f4d27028602311b40')

build() {
    cd qpdftools-$pkgver
    cmake -DCMAKE_BUILD_TYPE=Release .
    make
}

package() {
    cd qpdftools-$pkgver
    make DESTDIR="$pkgdir/" install
}
