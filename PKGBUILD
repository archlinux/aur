# Maintainer: Oleg Antonyan <oleg.b.antonyan@gmail.com>
# Contributor: Oleg Antonyan <oleg.b.antonyan@gmail.com>

pkgname=mpz
pkgver=1.0.8
pkgrel=0
pkgdesc='Music player for the large local collections'
arch=('x86_64')
url="https://github.com/olegantonyan/mpz"
license=('GPL3')
depends=('qt5-multimedia' 'qt5-x11extras' 'hicolor-icon-theme')
provides=('mpz')
source=("$pkgname-$pkgver-$pkgrel.zip::https://github.com/olegantonyan/mpz/archive/8ae4762ffef58ef6803413529d1c0a76f938e0a5.zip")
sha256sums=('9cfacc00fc7986ae5830af1b2d52b1295770cb9287446b11101c83f84635e0b1')

build() {
    cd $pkgname-8ae4762ffef58ef6803413529d1c0a76f938e0a5

    rm -rf build
    mkdir build
    cd build
    qmake-qt5 CONFIG+=release ..
    make
}

package() {
    cd $pkgname-8ae4762ffef58ef6803413529d1c0a76f938e0a5

    cd build
    make install INSTALL_ROOT=$pkgdir
}
