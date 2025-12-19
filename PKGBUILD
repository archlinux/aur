# Maintainer: Dennis van der Schagt <dennisschagt@gmail.com>
pkgname=eprosima-fast-dds
pkgver=3.4.1
pkgrel=1
pkgdesc="eProsima's Fast-DDS implementation"
arch=('x86_64')
url="https://github.com/eProsima/Fast-DDS"
license=('Apache')
depends=('foonathan_memory' 'asio' 'tinyxml2' 'eprosima-fast-cdr')
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
source=(
	"https://github.com/eProsima/Fast-DDS/archive/v${pkgver}.tar.gz"
)
noextract=()
sha256sums=(
	'aa81801c1e14af71acd2bf897dd351e66d4dfaac15751c074c715779252aebbb'
)
validpgpkeys=()

build() {
    cd "Fast-DDS-$pkgver"
    cmake -B build \
          -DCMAKE_INSTALL_PREFIX=/usr \
          .
    cmake --build build --parallel 8
}

package() {
    cd "Fast-DDS-$pkgver"
    make -C build DESTDIR="$pkgdir/" install
}
