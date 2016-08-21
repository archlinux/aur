# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=hotpatch
pkgver=0.2
pkgrel=1
pkgdesc="Hot patching executables on Linux using .so file injection."
arch=(any)
url="https://github.com/vikasnkumar/hotpatch"
license=('New BSD')
groups=()
depends=("cmake" "make")
makedepends=("cmake" "make")
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver"::"git+https://github.com/vikasnkumar/hotpatch.git")
noextract=()
md5sums=(SKIP)
validpgpkeys=()

prepare() {
    cd "$pkgname-$pkgver"
}

build() {
    cd "$pkgname-$pkgver"
    cmake .
    make
}

check() {
    cd "$pkgname-$pkgver"
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}
