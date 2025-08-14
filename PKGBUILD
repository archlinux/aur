# Maintainer: Mark Kiraly <mark.kiraly.hu@gmail.com>
pkgname=muzplayer
pkgver=1.0.0
pkgrel=1
pkgdesc="Tiny music player app with custom randomization streaming algorithm."
arch=('x86_64')
url="https://github.com/ProgrammerGnome/muzplayer"
license=('MIT')
depends=('qt6-base' 'qt6-multimedia')
makedepends=('cmake' 'gcc' 'qt6-tools')
source=("https://github.com/ProgrammerGnome/muzplayer/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('730aeef9bf48953e7b43673510b3d42bc2919033e684811b681fcdaed073fc52')  # Replace with actual sha256 sum

build() {
    cd "$srcdir/muzplayer-${pkgver}" || exit
    mkdir -p build
    cd build || exit
    cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
    cd "$srcdir/muzplayer-${pkgver}/build" || exit
    make DESTDIR="$pkgdir" install
}
