# Maintainer: Oleg Antonyan <oleg.b.antonyan@gmail.com>
# Contributor: Oleg Antonyan <oleg.b.antonyan@gmail.com>

pkgname=mpz
pkgver=1.0.13
pkgrel=0
pkgdesc='Music player for the large local collections'
arch=('x86_64')
url="https://github.com/olegantonyan/mpz"
license=('GPL3')
depends=('qt5-multimedia' 'qt5-x11extras' 'hicolor-icon-theme')
provides=('mpz')
source=("$pkgname-$pkgver-$pkgrel.zip::https://github.com/olegantonyan/mpz/archive/8c3a85c700e79b322f4a632ebb6d7d9b6c1ef122.zip")
sha256sums=('4d5be20836e89c45d20eb54ce05b2efcdf607322608cddb1c46adde12ebc42c8')

build() {
    cd $pkgname-8c3a85c700e79b322f4a632ebb6d7d9b6c1ef122

    rm -rf build
    mkdir build
    cd build
    qmake-qt5 CONFIG+=release ..
    make
}

package() {
    cd $pkgname-8c3a85c700e79b322f4a632ebb6d7d9b6c1ef122

    cd build
    make install INSTALL_ROOT=$pkgdir
}
