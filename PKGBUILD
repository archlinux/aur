pkgname=attackshark-x11
pkgver=2.2
pkgrel=2
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
sha256sums=('9fafd9d21bc7984de430e14a63a99f760488e4f653db6bbaae323bdcade31d55')

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
