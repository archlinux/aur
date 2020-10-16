# Maintainer: Oleg Antonyan <oleg.b.antonyan@gmail.com>
# Contributor: Oleg Antonyan <oleg.b.antonyan@gmail.com>

pkgname=mpz
pkgver=1.0.3
pkgrel=0
pkgdesc='Music player for the large local collections'
arch=('x86_64')
url="https://github.com/olegantonyan/mpz"
license=('GPL3')
depends=('qt5-multimedia' 'qt5-x11extras' 'hicolor-icon-theme')
provides=('mpz')
source=("$pkgname-$pkgver-$pkgrel.zip::https://github.com/olegantonyan/mpz/archive/55691eceef565abee5e3008dac12c9086e9c79b5.zip")
sha256sums=('4ba552ab708424e411738ca78b412b57a771b83cd797e27ce484ce9b0e9339b1')

build() {
    cd $pkgname-55691eceef565abee5e3008dac12c9086e9c79b5

    rm -rf build
    mkdir build
    cd build
    qmake-qt5 CONFIG+=release ..
    make
}

package() {
    cd $pkgname-55691eceef565abee5e3008dac12c9086e9c79b5

    cd build
    make install INSTALL_ROOT=$pkgdir
}
