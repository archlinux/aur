# Maintainer: Oleg Antonyan <oleg.b.antonyan@gmail.com>
# Contributor: Oleg Antonyan <oleg.b.antonyan@gmail.com>

pkgname=mpz
pkgver=1.0.19
pkgrel=0
pkgdesc='Music player for the large local collections'
arch=('x86_64')
url="https://github.com/olegantonyan/mpz"
license=('GPL3')
depends=('qt5-multimedia' 'qt5-x11extras' 'hicolor-icon-theme')
provides=('mpz')
source=("$pkgname-$pkgver-$pkgrel.zip::https://github.com/olegantonyan/mpz/archive/e859f637b381e93adff283bc2b0f46079949c18b.zip")
sha256sums=('40483dc5b929141e9d1fc165f4ade1b9e8b2ddeb2758845f06c5209d0de3a959')

build() {
    cd $pkgname-e859f637b381e93adff283bc2b0f46079949c18b

    rm -rf build
    mkdir build
    cd build
    qmake-qt5 CONFIG+=release ..
    make
}

package() {
    cd $pkgname-e859f637b381e93adff283bc2b0f46079949c18b

    cd build
    make install INSTALL_ROOT=$pkgdir
}
