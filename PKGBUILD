# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=enzyme
pkgver=0.0.292
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
sha256sums=('1974c7430eaab3161c4f2eb36db98296aeab73568651b83f2a8212521e1faf4b')

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
