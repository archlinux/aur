# Maintainer: Oleg Antonyan <oleg.b.antonyan@gmail.com>
# Contributor: Oleg Antonyan <oleg.b.antonyan@gmail.com>

pkgname=mpz
pkgver=0.0.13
pkgrel=1
pkgdesc='Music player for the large local collections'
arch=('x86_64')
url="https://github.com/olegantonyan/mpz"
license=('GPL3')
depends=('qt5-multimedia' 'qt5-x11extras' 'hicolor-icon-theme')
provides=('mpz')
source=(https://github.com/olegantonyan/mpz/archive/0.0.13.tar.gz)
sha256sums=('c97eda33741a906aba4bd66613e45b79a044d7dc282ea1e72f22feec3e1f03b8')

build() {
    cd $pkgname-$pkgver

    rm -rf build
    mkdir build
    cd build
    qmake-qt5 CONFIG+=release ..
    make
}

package() {
    cd $pkgname-$pkgver

    cd build
    make install INSTALL_ROOT=$pkgdir
}
