# Maintainer: Dennis van der Schagt <dennisschagt@gmail.com>
pkgname=eprosima-micro-cdr
pkgver=2.0.2
pkgrel=2
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
sha256sums=('92f2819f2cb769162358b6f6577000cc5a583ef9c69d13a628ee0abd1f7c3d1f')
validpgpkeys=()

build() {
    cd "Micro-CDR-$pkgver"
    cmake -B build \
          -DCMAKE_INSTALL_PREFIX=/usr \
          -DUCDR_ISOLATED_INSTALL=OFF \
          -DBUILD_SHARED_LIBS=ON \
          .
    cmake --build build --parallel 8
}

package() {
    cd "Micro-CDR-$pkgver"
    make -C build DESTDIR="$pkgdir/" install
}
