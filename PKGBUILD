# Maintainer: Dennis van der Schagt <dennisschagt@gmail.com>
pkgname=eprosima-fast-dds
pkgver=2.3.2
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
sha256sums=('4d8183cf4d37c3de9e6fd28d2850dd08023a9079001c4880b23c95f0d8c0b5ce')
validpgpkeys=()

build() {
    cd "Fast-DDS-$pkgver"
    cmake -B build \
          -DCMAKE_INSTALL_PREFIX=/usr \
          .
    make -C build
}

package() {
    cd "Fast-DDS-$pkgver"
    make -C build DESTDIR="$pkgdir/" install
}
