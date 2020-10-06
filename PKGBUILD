# Maintainer: Oleg Antonyan <oleg.b.antonyan@gmail.com>
# Contributor: Oleg Antonyan <oleg.b.antonyan@gmail.com>

pkgname=mpz
pkgver=0.0.18
pkgrel=0
pkgdesc='Music player for the large local collections'
arch=('x86_64')
url="https://github.com/olegantonyan/mpz"
license=('GPL3')
depends=('qt5-multimedia' 'qt5-x11extras' 'hicolor-icon-theme')
provides=('mpz')
source=("$pkgname-$pkgver-$pkgrel.zip::https://github.com/olegantonyan/mpz/archive/bcba245a79952e618407cc926bb04af83ed6dc72.zip")
sha256sums=('1c0dbcfeb8a25933bd73797ea6ca644d3a0b62b045f56492931b5806d82efa03')

build() {
    cd $pkgname-bcba245a79952e618407cc926bb04af83ed6dc72

    rm -rf build
    mkdir build
    cd build
    qmake-qt5 CONFIG+=release ..
    make
}

package() {
    cd $pkgname-bcba245a79952e618407cc926bb04af83ed6dc72

    cd build
    make install INSTALL_ROOT=$pkgdir
}
