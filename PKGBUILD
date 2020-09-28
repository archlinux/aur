# Maintainer: Oleg Antonyan <oleg.b.antonyan@gmail.com>
# Contributor: Oleg Antonyan <oleg.b.antonyan@gmail.com>

pkgname=mpz
pkgver=0.0.14
pkgrel=30
pkgdesc='Music player for the large local collections'
arch=('x86_64')
url="https://github.com/olegantonyan/mpz"
license=('GPL3')
depends=('qt5-multimedia' 'qt5-x11extras' 'hicolor-icon-theme')
provides=('mpz')
source=(https://github.com/olegantonyan/mpz/archive/master.zip)
sha256sums=('44287d002929b313a667f399b1ec710e448425cd347df439426f8d766ea48500')

build() {
    cd $pkgname-master

    rm -rf build
    mkdir build
    cd build
    qmake-qt5 CONFIG+=release ..
    make
}

package() {
    cd $pkgname-master

    cd build
    make install INSTALL_ROOT=$pkgdir
}
