# Maintainer: Dennis van der Schagt <dennisschagt@gmail.com>
pkgname=eprosima-fast-cdr
pkgver=1.0.21
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
sha256sums=('c1f32bdd76910ada00d551eb8828de7561ad2b2846d063cb4316f9262c03c77d')
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
