# Maintainer: Dennis van der Schagt <dennisschagt@gmail.com>
pkgname=eprosima-fast-cdr
pkgver=1.0.24
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
sha256sums=('ecd688ab89ff1c03b9031c314891ae60995e2e73d919b93569eb840d6e87dec2')
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
