# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=enzyme
pkgver=0.0.69
pkgrel=1
pkgdesc="High-performance automatic differentiation of LLVM and MLIR."
arch=(any)
url="https://enzyme.mit.edu"
license=('Apache')
groups=()
depends=(llvm)
makedepends=(cmake ninja)
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
sha256sums=('144d964187551700fdf0a4807961ceab1480d4e4cd0bb0fc7bbfab48fe053aa2')

build() {
    cmake -B build -S "Enzyme-$pkgver/enzyme" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev \
		-G Ninja
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
