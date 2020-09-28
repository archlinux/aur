# Maintainer: Oleg Antonyan <oleg.b.antonyan@gmail.com>
# Contributor: Oleg Antonyan <oleg.b.antonyan@gmail.com>

pkgname=mpz
pkgver=0.0.13
pkgrel=27
pkgdesc='Music player for the large local collections'
arch=('x86_64')
url="https://github.com/olegantonyan/mpz"
license=('GPL3')
depends=('qt5-multimedia' 'qt5-x11extras' 'hicolor-icon-theme')
provides=('mpz')
source=(https://github.com/olegantonyan/mpz/archive/master.zip)
sha256sums=('74da7fce9e933b6094a873e4aa6f0b60ff8c24de74492b3928ee506749e5e114')

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
