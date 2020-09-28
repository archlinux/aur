# Maintainer: Oleg Antonyan <oleg.b.antonyan@gmail.com>
# Contributor: Oleg Antonyan <oleg.b.antonyan@gmail.com>

pkgname=mpz
pkgver=0.0.13
pkgrel=25
pkgdesc='Music player for the large local collections'
arch=('x86_64')
url="https://github.com/olegantonyan/mpz"
license=('GPL3')
depends=('qt5-multimedia' 'qt5-x11extras' 'hicolor-icon-theme')
provides=('mpz')
source=(https://github.com/olegantonyan/mpz/archive/master.zip)
sha256sums=('1e7dbcddc0a7df91d82a0ee274f5b05f35fe4027dbd5b5b2ffb1810a4e6df5f2')

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
