# Maintainer: Oleg Antonyan <oleg.b.antonyan@gmail.com>
# Contributor: Oleg Antonyan <oleg.b.antonyan@gmail.com>

pkgname=mpz
pkgver=1.0.19
pkgrel=10
pkgdesc='Music player for the large local collections'
arch=('x86_64')
url="https://github.com/olegantonyan/mpz"
license=('GPL3')
depends=('qt5-multimedia' 'qt5-x11extras' 'hicolor-icon-theme')
provides=('mpz')
conflicts=('mpz-qt6')
source=("$pkgname-$pkgver-$pkgrel.zip::https://github.com/olegantonyan/mpz/archive/e30a1fd5d96158541bbd60bedfa35414516c1235.zip")
sha256sums=('40a084141e16395892dff20226f02ffb1ab4f472c06954fa90fb2f31f42aef07')

build() {
    cd $pkgname-e30a1fd5d96158541bbd60bedfa35414516c1235

    rm -rf build
    mkdir build
    cd build
    qmake-qt5 CONFIG+=release ..
    make
}

package() {
    cd $pkgname-e30a1fd5d96158541bbd60bedfa35414516c1235

    cd build
    make install INSTALL_ROOT=$pkgdir
}
