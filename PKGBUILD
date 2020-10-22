# Maintainer: Oleg Antonyan <oleg.b.antonyan@gmail.com>
# Contributor: Oleg Antonyan <oleg.b.antonyan@gmail.com>

pkgname=mpz
pkgver=1.0.7
pkgrel=0
pkgdesc='Music player for the large local collections'
arch=('x86_64')
url="https://github.com/olegantonyan/mpz"
license=('GPL3')
depends=('qt5-multimedia' 'qt5-x11extras' 'hicolor-icon-theme')
provides=('mpz')
source=("$pkgname-$pkgver-$pkgrel.zip::https://github.com/olegantonyan/mpz/archive/75904749b1abb48cc6864778bb32a8bdfd428d5f.zip")
sha256sums=('014b91884aa1bcde184088ab1ebd21f3ce9d1e181b2273d311d68e46b868e31c')

build() {
    cd $pkgname-75904749b1abb48cc6864778bb32a8bdfd428d5f

    rm -rf build
    mkdir build
    cd build
    qmake-qt5 CONFIG+=release ..
    make
}

package() {
    cd $pkgname-75904749b1abb48cc6864778bb32a8bdfd428d5f

    cd build
    make install INSTALL_ROOT=$pkgdir
}
