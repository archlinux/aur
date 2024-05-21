# Maintainer: Oleg Antonyan <oleg.b.antonyan@gmail.com>
# Contributor: Oleg Antonyan <oleg.b.antonyan@gmail.com>

pkgname=mpz
pkgver=1.0.24
pkgrel=0
pkgdesc='Music player for the large local collections'
arch=('x86_64')
url="https://github.com/olegantonyan/mpz"
license=('GPL3')
depends=('qt6-multimedia' 'hicolor-icon-theme' 'yaml-cpp' 'taglib')
provides=('mpz')
source=("$pkgname-$pkgver-$pkgrel.zip::https://github.com/olegantonyan/mpz/archive/8553675f4415d756361c7737ff659ddd5b1cea05.zip")
sha256sums=('f67f1cfdcf29390e03b57985a55e865d5ccdadcb0a37d9985add7211ac79099b')

build() {
    cd mpz-8553675f4415d756361c7737ff659ddd5b1cea05

    rm -rf build
    mkdir build
    cd build
    qmake6 CONFIG+=release DEFINES+=USE_SYSTEM_TAGLIB DEFINES+=USE_SYSTEM_YAMLCPP ..
    make
}

package() {
    cd mpz-8553675f4415d756361c7737ff659ddd5b1cea05

    cd build
    make install INSTALL_ROOT=$pkgdir
}
