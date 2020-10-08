# Maintainer: Oleg Antonyan <oleg.b.antonyan@gmail.com>
# Contributor: Oleg Antonyan <oleg.b.antonyan@gmail.com>

pkgname=mpz
pkgver=1.0.1
pkgrel=0
pkgdesc='Music player for the large local collections'
arch=('x86_64')
url="https://github.com/olegantonyan/mpz"
license=('GPL3')
depends=('qt5-multimedia' 'qt5-x11extras' 'hicolor-icon-theme')
provides=('mpz')
source=("$pkgname-$pkgver-$pkgrel.zip::https://github.com/olegantonyan/mpz/archive/17106c35b09bc345ddb7b6a48122f4c8bf77f6f8.zip")
sha256sums=('68d5ce9291ebb62c3db78724cf515baae491d847f84410de0ce9effe9f703e1d')

build() {
    cd $pkgname-17106c35b09bc345ddb7b6a48122f4c8bf77f6f8

    rm -rf build
    mkdir build
    cd build
    qmake-qt5 CONFIG+=release ..
    make
}

package() {
    cd $pkgname-17106c35b09bc345ddb7b6a48122f4c8bf77f6f8

    cd build
    make install INSTALL_ROOT=$pkgdir
}
