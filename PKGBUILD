# Maintainer: Dennis van der Schagt <dennisschagt@gmail.com>
pkgname=eprosima-micro-cdr
pkgver=2.0.1
pkgrel=1
pkgdesc="eProsima's Micro-CDR for serialization and deserialization"
arch=('x86_64')
url="https://github.com/eProsima/Micro-CDR"
license=('Apache')
depends=()
makedepends=('cmake')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/eProsima/Micro-CDR/archive/v${pkgver}.tar.gz")
noextract=()
sha256sums=('bcc16517acc55a58fad6d39cfa42ba3658e2c7d0f408af5b1a27b634072d64b6')
validpgpkeys=()

build() {
    cd "Micro-CDR-$pkgver"
    cmake -B build \
          -DCMAKE_INSTALL_PREFIX=/usr \
          -DUCDR_ISOLATED_INSTALL=OFF \
          .
    make -C build
}

package() {
    cd "Micro-CDR-$pkgver"
    make -C build DESTDIR="$pkgdir/" install
}
