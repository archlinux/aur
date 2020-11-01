# Maintainer: Oleg Antonyan <oleg.b.antonyan@gmail.com>
# Contributor: Oleg Antonyan <oleg.b.antonyan@gmail.com>

pkgname=mpz
pkgver=1.0.9
pkgrel=0
pkgdesc='Music player for the large local collections'
arch=('x86_64')
url="https://github.com/olegantonyan/mpz"
license=('GPL3')
depends=('qt5-multimedia' 'qt5-x11extras' 'hicolor-icon-theme')
provides=('mpz')
source=("$pkgname-$pkgver-$pkgrel.zip::https://github.com/olegantonyan/mpz/archive/0204e9088a4a57b55fb218613b5d5ed2c81cd1f8.zip")
sha256sums=('f1d44d68f02ec9dcb95fd8568141b033633a16e0d30f730274fa4ceac726b60c')

build() {
    cd $pkgname-0204e9088a4a57b55fb218613b5d5ed2c81cd1f8

    rm -rf build
    mkdir build
    cd build
    qmake-qt5 CONFIG+=release ..
    make
}

package() {
    cd $pkgname-0204e9088a4a57b55fb218613b5d5ed2c81cd1f8

    cd build
    make install INSTALL_ROOT=$pkgdir
}
