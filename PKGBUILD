# Maintainer: Dennis van der Schagt <dennisschagt@gmail.com>
pkgname=eprosima-fast-dds
pkgver=2.8.0
pkgrel=1
pkgdesc="eProsima's Fast-DDS implementation"
arch=('x86_64')
url="https://github.com/eProsima/Fast-DDS"
license=('Apache')
depends=('foonathan_memory-shared' 'asio' 'tinyxml2' 'eprosima-fast-cdr')
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
source=("https://github.com/eProsima/Fast-DDS/archive/v${pkgver}.tar.gz")
noextract=()
sha256sums=('a0b1e2cd3658e891aefd328a3272439324fba788afa843e845cef59d4be56e2c')
validpgpkeys=()

build() {
    cd "Fast-DDS-$pkgver"
    cmake -B build \
          -DCMAKE_INSTALL_PREFIX=/usr \
          .
    make -C build -j8
}

package() {
    cd "Fast-DDS-$pkgver"
    make -C build DESTDIR="$pkgdir/" install
}
