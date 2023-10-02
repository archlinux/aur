# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=enzyme
pkgver=0.0.86
pkgrel=1
pkgdesc="High-performance automatic differentiation of LLVM and MLIR."
arch=(any)
url="https://enzyme.mit.edu"
license=('Apache')
groups=()
depends=(llvm clang)
makedepends=(cmake)
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/EnzymeAD/Enzyme/archive/v${pkgver}.tar.gz")
noextract=()
sha256sums=('b13cdaed1fbf69152a74850dfabd1a23e778d8a722fba95261cda3277f1994c2')

build() {
    cmake -B build -S "Enzyme-$pkgver/enzyme" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DLLVM_DIR='/usr/lib/cmake/llvm' \
        -DClang_DIR='/usr/lib/cmake/clang' \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
