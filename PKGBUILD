# Maintainer: Dennis van der Schagt <dennisschagt@gmail.com>
pkgname=eprosima-micro-cdr
pkgver=1.2.1
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
sha256sums=('f91c6f5579d8218abe54fff306b3f5af6bded9719d56e8ead20810f1da3b7ae8')
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
