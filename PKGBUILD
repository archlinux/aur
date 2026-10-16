pkgname=attackshark-x11
pkgver=2.0.2
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
sha256sums=('274335d55160f6ae060a0467b32d46ea0125da25e2b9f398c8edb93fd688ebe8')

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
