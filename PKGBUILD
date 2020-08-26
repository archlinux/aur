# Maintainer: Dennis van der Schagt <dennisschagt@gmail.com>
pkgname=eprosima-micro-cdr
pkgver=1.2.0
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
sha256sums=('15257c7bc347f62195f03b97f09a23fee7ce36ad91ce830f24bc3e9216d8d30a')
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
