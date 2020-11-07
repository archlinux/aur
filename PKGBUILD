# Maintainer: Oleg Antonyan <oleg.b.antonyan@gmail.com>
# Contributor: Oleg Antonyan <oleg.b.antonyan@gmail.com>

pkgname=mpz
pkgver=1.0.10
pkgrel=0
pkgdesc='Music player for the large local collections'
arch=('x86_64')
url="https://github.com/olegantonyan/mpz"
license=('GPL3')
depends=('qt5-multimedia' 'qt5-x11extras' 'hicolor-icon-theme')
provides=('mpz')
source=("$pkgname-$pkgver-$pkgrel.zip::https://github.com/olegantonyan/mpz/archive/56f90692b08525f2ffff1174b4fd344cde775462.zip")
sha256sums=('c9a971cefbb63c18533f2dd016d9199bf38536991d4d468dab41f6c78de623ce')

build() {
    cd $pkgname-56f90692b08525f2ffff1174b4fd344cde775462

    rm -rf build
    mkdir build
    cd build
    qmake-qt5 CONFIG+=release ..
    make
}

package() {
    cd $pkgname-56f90692b08525f2ffff1174b4fd344cde775462

    cd build
    make install INSTALL_ROOT=$pkgdir
}
