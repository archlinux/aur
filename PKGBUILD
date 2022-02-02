# Maintainer: Dennis van der Schagt <dennisschagt@gmail.com>
pkgname=eprosima-fast-cdr
pkgver=1.0.23
pkgrel=1
pkgdesc="eProsima's Fast-CDR for serialization and deserialization"
arch=('x86_64')
url="https://github.com/eProsima/Fast-CDR"
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
source=("https://github.com/eProsima/Fast-CDR/archive/v${pkgver}.tar.gz")
noextract=()
sha256sums=('6f7c9c6c0c82c150b5ea2b0a58d5c9a466b87a1fcfca40d5786d99d4963a6721')
validpgpkeys=()

build() {
    cd "Fast-CDR-$pkgver"
    cmake -B build \
          -DCMAKE_INSTALL_PREFIX=/usr \
          .
    make -C build
}

package() {
    cd "Fast-CDR-$pkgver"
    make -C build DESTDIR="$pkgdir/" install
}
