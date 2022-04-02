# Maintainer: Silas Henrique <silash35@gmail.com>
pkgname=qpdftools
pkgver=2.0
pkgrel=1
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
md5sums=('3220ae72d82e25146603e3d341b1f391')
sha512sums=('a89702d87f5b3d24496dc14cc9474be6f0f9bd649171cf55f3ba62081738236f7199074022cb26a68bc3b3024669a65d9c07774450c29ede1799e13977fc9312')

build() {
    cd qpdftools-$pkgver
    cmake -DCMAKE_BUILD_TYPE=Release .
    make
}

package() {
    cd qpdftools-$pkgver
    make DESTDIR="$pkgdir/" install
}
