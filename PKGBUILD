# Maintainer: Dennis van der Schagt <dennisschagt@gmail.com>
pkgname=eprosima-fast-cdr
pkgver=1.1.0
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
sha256sums=('5c4b2ad5493abd30b9475b14856641a8944c98077a36bd0760c1d83c65216e67')
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
