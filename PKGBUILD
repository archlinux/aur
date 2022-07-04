# Maintainer: Silas Henrique <silash35@gmail.com>
pkgname=qpdftools
pkgver=2.0.4
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
md5sums=('ac10539c193882703c58dbb13c890e15')
sha512sums=('cf4584e86261469d50bef335e544311f24bd476cbc148805f103193981ca2920a8338dd1bc323abb4706d842c5c63a87a6d840e4f0e2d720b0dad5cdbcc4f23e')

build() {
    cd qpdftools-$pkgver
    cmake -DCMAKE_BUILD_TYPE=Release .
    make
}

package() {
    cd qpdftools-$pkgver
    make DESTDIR="$pkgdir/" install
}
