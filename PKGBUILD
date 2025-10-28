# Maintainer: 2IMT <contact.2imt@mail.ru>
pkgname="resemb"
pkgver="0.1.0"
pkgrel=1
epoch=
pkgdesc="Tool to bake assets into your executable"
arch=("x86_64")
url="https://github.com/2IMT/resemb"
license=("MIT")
groups=()
depends=("glibc" "gcc-libs")
makedepends=("cmake" "gcc")
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/2IMT/resemb/archive/refs/tags/v${pkgver}.tar.gz")
noextract=()
sha256sums=("54fa8522e424001fa2ac500e104ba0b2ffeae166fdd82b7b1ee991b821870ff7")
validpgpkeys=()

build() {
    cd  $pkgname-$pkgver
    mkdir build
    cd build
    cmake -DCMAKE_BUILD_TYPE=Release ..
    cmake --build .
}

package() {
    cd $pkgname-$pkgver
    cd build
    DESTDIR=$pkgdir cmake --install .
}
