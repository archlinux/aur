pkgname=attackshark-x11
pkgver=1.0.2
pkgrel=1
pkgdesc="Attack Shark mouse configuration utility for Linux X11"
arch=('x86_64')
url="https://github.com/iago-fragnan/attack-shark-x11-linux"
license=('GPL3')
depends=(
    'qt6-base'
    'systemd'
    'libusb'
)
makedepends=('cmake')
source=(
    "$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('4a5039fbf7fd4cbd73f575fe148e4da9f8ed704016154c402f01e2c227038216')

build() {
    cd "$srcdir/attack-shark-x11-linux-$pkgver"

    cmake -B build \
          -S . \
          -DCMAKE_BUILD_TYPE=Release

    cmake --build build
}

package() {
    cd "$srcdir/attack-shark-x11-linux-$pkgver"

    DESTDIR="$pkgdir" cmake --install build
}
