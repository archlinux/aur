# Maintainer: Simon Eriksson <simon.eriksson.1187+aur AT gmail.com>

pkgname=armips
pkgver=0.11.0
pkgrel=1
pkgdesc='An assembler for various ARM and MIPS platforms'
arch=('x86_64')
url='https://github.com/Kingcom/armips'
license=('MIT')
makedepends=('cmake')
depends=('gcc-libs')
source=("https://github.com/Kingcom/armips/archive/v${pkgver}.tar.gz")
sha256sums=('c94e29dfda3bdf853590d825562b9c73a3d8e8e995555e021c6b2a6451572681')

prepare() {
    cd "$srcdir"/armips-0.11.0
    mkdir -p build
}

build() {
    cd "$srcdir"/armips-0.11.0/build
    cmake -DCMAKE_BUILD_TYPE=Release ..
    make armips-bin
}

package() {
    cd "$srcdir"/armips-0.11.0
    install -Dm755 build/armips "$pkgdir"/usr/bin/armips
    install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
