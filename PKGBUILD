# Maintainer: Oleg Antonyan <oleg.b.antonyan@gmail.com>
# Contributor: Oleg Antonyan <oleg.b.antonyan@gmail.com>

pkgname=mpz-qt6
pkgver=1.0.19
pkgrel=12
pkgdesc='Music player for the large local collections (Qt6 version)'
arch=('x86_64')
url="https://github.com/olegantonyan/mpz"
license=('GPL3')
depends=('qt6-multimedia' 'hicolor-icon-theme')
provides=('mpz-qt6')
conflicts=('mpz')
source=("$pkgname-$pkgver-$pkgrel.zip::https://github.com/olegantonyan/mpz/archive/c04b423b1bcb86b9510ef099b825293c5986d653.zip")
sha256sums=('6f796226a1d51c763a23384c16d24c4fdbdce46a3d24e7aba506306fc9d97fe4')

build() {
    cd $pkgname-c04b423b1bcb86b9510ef099b825293c5986d653

    rm -rf build
    mkdir build
    cd build
    qmake6 CONFIG+=release ..
    make
}

package() {
    cd $pkgname-c04b423b1bcb86b9510ef099b825293c5986d653

    cd build
    make install INSTALL_ROOT=$pkgdir
}
