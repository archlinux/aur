pkgname=attackshark-x11
pkgver=1.0.1
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
sha256sums=('a5f2a5a6d46e272da05c259be549b2ec04224bd63a7778fcfb1f945788c813a8')

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
