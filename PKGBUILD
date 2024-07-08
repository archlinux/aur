# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=enzyme
pkgver=0.0.132
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
sha256sums=('3fb829f59da6e180721c3c6ffc0cbf95906d4705037cea9d6c06230b09656a22')

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
