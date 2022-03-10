# Maintainer: Dennis van der Schagt <dennisschagt@gmail.com>
pkgname=eprosima-micro-xrce-dds-client
pkgver=2.1.1
pkgrel=1
pkgdesc="eProsima's XRCE DDS client"
arch=('x86_64')
url="https://github.com/eProsima/Micro-XRCE-DDS-Client"
license=('Apache')
depends=('eprosima-micro-cdr')
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
source=("https://github.com/eProsima/Micro-XRCE-DDS-Client/archive/v${pkgver}.tar.gz")
noextract=()
sha256sums=('8a1eba34562475c0bb00b4947c276b8872c901e4e2709475947c784bd7d7f823')
validpgpkeys=()

build() {
    cd "Micro-XRCE-DDS-Client-$pkgver"
    cmake -B build \
          -DCMAKE_INSTALL_PREFIX=/usr \
          -DUCLIENT_ISOLATED_INSTALL=OFF \
          -DUCLIENT_SUPERBUILD=OFF \
          .
    make -C build
}

package() {
    cd "Micro-XRCE-DDS-Client-$pkgver"
    make -C build DESTDIR="$pkgdir/" install
}
