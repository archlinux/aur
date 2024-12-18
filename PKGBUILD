# Maintainer: Oleg Antonyan <oleg.b.antonyan@gmail.com>
# Contributor: Oleg Antonyan <oleg.b.antonyan@gmail.com>

pkgname=mpz
pkgver=1.1.0
pkgrel=2
pkgdesc='Music player for the large local collections'
arch=('x86_64')
url="https://github.com/olegantonyan/mpz"
license=('GPL3')
depends=('cmake' 'qt6-multimedia' 'hicolor-icon-theme' 'yaml-cpp' 'taglib')
provides=('mpz')
source=("$pkgname-$pkgver-$pkgrel.zip::https://github.com/olegantonyan/mpz/archive/92b49ee32f9bf052ef6f3a6d47f5c59d2dfbda5b.zip")
sha256sums=('e972726ca85ea9583fbedbeacd25579264f4d09c50b6672b71333d2b54d5087b')

build() {
    cd mpz-92b49ee32f9bf052ef6f3a6d47f5c59d2dfbda5b

    rm -rf build
    mkdir build
    cd build
    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DUSE_SYSTEM_TAGLIB=ON -DUSE_SYSTEM_YAMLCPP=ON ..
    cmake --build .
}

package() {
    cd mpz-92b49ee32f9bf052ef6f3a6d47f5c59d2dfbda5b

    cd build
    DESTDIR="$pkgdir" cmake --install .
}
