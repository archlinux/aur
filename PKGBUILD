# Maintainer: Dennis van der Schagt <dennisschagt@gmail.com>
pkgname=eprosima-micro-cdr
pkgver=2.0.0
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
sha256sums=('06b982a12b5a6b7788161259cf28c598a811bcc039f714986611903dc2be64e9')
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
