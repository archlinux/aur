# Maintainer: Oleg Antonyan <oleg.b.antonyan@gmail.com>
# Contributor: Oleg Antonyan <oleg.b.antonyan@gmail.com>

pkgname=mpz
pkgver=0.0.17
pkgrel=0
pkgdesc='Music player for the large local collections'
arch=('x86_64')
url="https://github.com/olegantonyan/mpz"
license=('GPL3')
depends=('qt5-multimedia' 'qt5-x11extras' 'hicolor-icon-theme')
provides=('mpz')
source=("$pkgname-$pkgver-$pkgrel.zip::https://github.com/olegantonyan/mpz/archive/5ff1a9a3095469a4368e9bf3f950b4980b8a4ff5.zip")
sha256sums=('4e83015f0a91f70f4414240e9421e4c57d53ba0b2cebb7a2c4285b69605cdeb4')

build() {
    cd $pkgname-5ff1a9a3095469a4368e9bf3f950b4980b8a4ff5

    rm -rf build
    mkdir build
    cd build
    qmake-qt5 CONFIG+=release ..
    make
}

package() {
    cd $pkgname-5ff1a9a3095469a4368e9bf3f950b4980b8a4ff5

    cd build
    make install INSTALL_ROOT=$pkgdir
}
