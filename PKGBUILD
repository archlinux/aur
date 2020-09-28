# Maintainer: Oleg Antonyan <oleg.b.antonyan@gmail.com>
# Contributor: Oleg Antonyan <oleg.b.antonyan@gmail.com>

pkgname=mpz
pkgver=0.0.14
pkgrel=6
pkgdesc='Music player for the large local collections'
arch=('x86_64')
url="https://github.com/olegantonyan/mpz"
license=('GPL3')
depends=('qt5-multimedia' 'qt5-x11extras' 'hicolor-icon-theme')
provides=('mpz')
source=(https://github.com/olegantonyan/mpz/archive/master.zip)
sha256sums=('77082e0f97eba4bb41a788f3482c190f4900eb259c7bbf0f2a1246dd9c2a9428')

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
