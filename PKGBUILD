# Maintainer: Dennis van der Schagt <dennisschagt@gmail.com>
pkgname=eprosima-fast-cdr
pkgver=1.0.27
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
sha256sums=('a9bc8fd31a2c2b95e6d2fb46e6ce1ad733e86dc4442f733479e33ed9cdc54bf6')
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
