pkgname=attackshark-x11
pkgver=2.0.1
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
sha256sums=('ce67b284ef339e8bce56d69e15bd94462a39f3a09711cc10beb9cbbe6260d7c7')

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
