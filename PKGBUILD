# Maintainer: Oleg Antonyan <oleg.b.antonyan@gmail.com>
# Contributor: Oleg Antonyan <oleg.b.antonyan@gmail.com>

pkgname=mpz-qt6
pkgver=1.0.19
pkgrel=16
pkgdesc='Music player for the large local collections (Qt6 version)'
arch=('x86_64')
url="https://github.com/olegantonyan/mpz"
license=('GPL3')
depends=('qt6-multimedia' 'hicolor-icon-theme')
provides=('mpz-qt6')
conflicts=('mpz')
source=("$pkgname-$pkgver-$pkgrel.zip::https://github.com/olegantonyan/mpz/archive/ee0b12c1d7359bbb14e3e280af64e647996f21b2.zip")
sha256sums=('1970651b292ec7b34952a018c0bb8b32a4f310adbbaeefedc803f2218f9ebfde')

build() {
    cd mpz-ee0b12c1d7359bbb14e3e280af64e647996f21b2

    rm -rf build
    mkdir build
    cd build
    qmake6 CONFIG+=release ..
    make
}

package() {
    cd mpz-ee0b12c1d7359bbb14e3e280af64e647996f21b2

    cd build
    make install INSTALL_ROOT=$pkgdir
}
