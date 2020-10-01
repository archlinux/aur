# Maintainer: Oleg Antonyan <oleg.b.antonyan@gmail.com>
# Contributor: Oleg Antonyan <oleg.b.antonyan@gmail.com>

pkgname=mpz
pkgver=0.0.15
pkgrel=9
pkgdesc='Music player for the large local collections'
arch=('x86_64')
url="https://github.com/olegantonyan/mpz"
license=('GPL3')
depends=('qt5-multimedia' 'qt5-x11extras' 'hicolor-icon-theme')
provides=('mpz')
source=("$pkgname-$pkgver-$pkgrel.zip::https://github.com/olegantonyan/mpz/archive/0b2aa7c6670d8b138b990cc83ed11ba662a92744.zip")
sha256sums=('996684a36d947334a873763630bf3acd85ce91e920455fbc18b48a42037fa6c5')

build() {
    cd $pkgname-0b2aa7c6670d8b138b990cc83ed11ba662a92744

    rm -rf build
    mkdir build
    cd build
    qmake-qt5 CONFIG+=release ..
    make
}

package() {
    cd $pkgname-0b2aa7c6670d8b138b990cc83ed11ba662a92744

    cd build
    make install INSTALL_ROOT=$pkgdir
}
