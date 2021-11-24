# Maintainer: Oleg Antonyan <oleg.b.antonyan@gmail.com>
# Contributor: Oleg Antonyan <oleg.b.antonyan@gmail.com>

pkgname=mpz
pkgver=1.0.16
pkgrel=0
pkgdesc='Music player for the large local collections'
arch=('x86_64')
url="https://github.com/olegantonyan/mpz"
license=('GPL3')
depends=('qt5-multimedia' 'qt5-x11extras' 'hicolor-icon-theme')
provides=('mpz')
source=("$pkgname-$pkgver-$pkgrel.zip::https://github.com/olegantonyan/mpz/archive/9dc1a4624b065a4907e9ca8adcce291b3a49707b.zip")
sha256sums=('e047dd45e652128c31ebac338906ac7ae198c20b2d2bb29b6ecd1d1d88487943')

build() {
    cd $pkgname-9dc1a4624b065a4907e9ca8adcce291b3a49707b

    rm -rf build
    mkdir build
    cd build
    qmake-qt5 CONFIG+=release ..
    make
}

package() {
    cd $pkgname-9dc1a4624b065a4907e9ca8adcce291b3a49707b

    cd build
    make install INSTALL_ROOT=$pkgdir
}
