# Maintainer: nyoravim <nora@bedafamily.com>

pkgname=libnyoravim-git
pkgver=1.0.0
pkgrel=1
pkgdesc="Personal C utility library."
arch=("any")
url="https://github.com/libnyoravim/libnyoravim"
license=("Apache-2.0")
groups=()
depends=("glibc")
makedepends=("git" "base-devel" "clang" "cmake")
provides=("libnyoravim")
conflicts=()
replaces=()
backup=()
options=()
install=
source=("git+https://github.com/nyoravim/libnyoravim.git#tag=${pkgver}")
noextract=()
sha256sums=("SKIP")

build() {
    cd "$srcdir/libnyoravim"
    cmake . -B build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -G "Unix Makefiles"
    make -C build -j $(nproc)
}

package() {
    cd "$srcdir/libnyoravim"
    make -C build DESTDIR="$pkgdir/" install
}
