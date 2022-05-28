# Maintainer: Oleg Antonyan <oleg.b.antonyan@gmail.com>
# Contributor: Oleg Antonyan <oleg.b.antonyan@gmail.com>

pkgname=mpz-qt6
pkgver=1.0.20
pkgrel=0
pkgdesc='Music player for the large local collections (Qt6 version)'
arch=('x86_64')
url="https://github.com/olegantonyan/mpz"
license=('GPL3')
depends=('qt6-multimedia' 'hicolor-icon-theme' 'yaml-cpp' 'taglib')
provides=('mpz')
conflicts=('mpz')
source=("$pkgname-$pkgver-$pkgrel.zip::https://github.com/olegantonyan/mpz/archive/bdda0545e6e41d5a8f404e29a4da492ae447cdac.zip")
sha256sums=('bd477f84d9b0e8e2494b904d5e6ae40a34a9896ea6b29fbbef21a6ff9f207d49')

build() {
    cd mpz-bdda0545e6e41d5a8f404e29a4da492ae447cdac

    rm -rf build
    mkdir build
    cd build
    qmake6 CONFIG+=release DEFINES+=USE_SYSTEM_TAGLIB DEFINES+=USE_SYSTEM_YAMLCPP ..
    make
}

package() {
    cd mpz-bdda0545e6e41d5a8f404e29a4da492ae447cdac

    cd build
    make install INSTALL_ROOT=$pkgdir
}
