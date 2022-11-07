# Maintainer: Oleg Antonyan <oleg.b.antonyan@gmail.com>
# Contributor: Oleg Antonyan <oleg.b.antonyan@gmail.com>

pkgname=mpz-qt6
pkgver=1.0.22
pkgrel=0
pkgdesc='Music player for the large local collections (Qt6 version)'
arch=('x86_64')
url="https://github.com/olegantonyan/mpz"
license=('GPL3')
depends=('qt6-multimedia' 'hicolor-icon-theme' 'yaml-cpp' 'taglib')
provides=('mpz')
conflicts=('mpz')
source=("$pkgname-$pkgver-$pkgrel.zip::https://github.com/olegantonyan/mpz/archive/df7dcad928dd4f61ef97d5e1878c2f664da543e0.zip")
sha256sums=('67414d8102c563117685a34dbf265775a7d5a76793df4374126b21a696ad77a4')

build() {
    cd mpz-df7dcad928dd4f61ef97d5e1878c2f664da543e0

    rm -rf build
    mkdir build
    cd build
    qmake6 CONFIG+=release DEFINES+=USE_SYSTEM_TAGLIB DEFINES+=USE_SYSTEM_YAMLCPP ..
    make
}

package() {
    cd mpz-df7dcad928dd4f61ef97d5e1878c2f664da543e0

    cd build
    make install INSTALL_ROOT=$pkgdir
}
