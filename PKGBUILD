# Maintainer: Oleg Antonyan <oleg.b.antonyan@gmail.com>
# Contributor: Oleg Antonyan <oleg.b.antonyan@gmail.com>

pkgname=mpz
pkgver=1.0.19
pkgrel=5
pkgdesc='Music player for the large local collections'
arch=('x86_64')
url="https://github.com/olegantonyan/mpz"
license=('GPL3')
depends=('qt5-multimedia' 'qt5-x11extras' 'hicolor-icon-theme')
provides=('mpz')
source=("$pkgname-$pkgver-$pkgrel.zip::https://github.com/olegantonyan/mpz/archive/e80c52835afb0801840ddf5690f654b7aa05c58c.zip")
sha256sums=('87d66274d1e92533adf7d25898ac28efa119fc9cc2cdd5d42444b0f13fb6e4b4')

build() {
    cd $pkgname-e80c52835afb0801840ddf5690f654b7aa05c58c

    rm -rf build
    mkdir build
    cd build
    qmake-qt5 CONFIG+=release ..
    make
}

package() {
    cd $pkgname-e80c52835afb0801840ddf5690f654b7aa05c58c

    cd build
    make install INSTALL_ROOT=$pkgdir
}
