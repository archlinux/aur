# Maintainer: BTuin <btuin at mailo dot com>
pkgname=tagtools
pkgver=v1.0.1
pkgrel=1
pkgdesc="A tool to list and edit audio files tags"
arch=('i686' 'x86_64')
url="https://gitlab.com/btuin2/tagtools"
license=('GPL')
depends=('nlohmann-json')
makedepends=('cmake' 'git')
optdepends=('bash-completion')
source=("https://gitlab.com/btuin2/tagtools/-/archive/$pkgver/tagtools-$pkgver.tar.gz")
sha256sums=('125f2172af6f0ca82af47216bce0234c7636a1b525ec639827f42138fd5706e8')

build() {
    cmake -B build -S "$pkgname-$pkgver" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
