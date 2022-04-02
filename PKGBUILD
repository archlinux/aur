# Maintainer: Silas Henrique <silash35@gmail.com>
pkgname=qpdftools
pkgver=2.0.3
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
md5sums=('b5533f72f4d1d65a319516bf621d1009')
sha512sums=('ba17023cc7ed0957318e3e54094ba6ca55ec2a9656ead881282af5db752f06c21ec07e0564c3ca0808329acda842dcf5a3acedbe0788b8d7bdd6e8d588e04166')

build() {
    cd qpdftools-$pkgver
    cmake -DCMAKE_BUILD_TYPE=Release .
    make
}

package() {
    cd qpdftools-$pkgver
    make DESTDIR="$pkgdir/" install
}
