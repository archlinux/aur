# Maintainer: Lukas Hertel <dev@lukas-hertel.de>
# Maintainer: Quentin Michaud <mh4ckt3mh4ckt1c4s@archlinux.org>
pkgname=iwasm
pkgver=2.4.3
pkgrel=1
pkgdesc="Executable binary built with WAMR VMCore, supporting WASI and CLI"
arch=('x86_64')
url="https://github.com/bytecodealliance/wasm-micro-runtime"
license=('Apache-2.0')
makedepends=('cmake' 'git')
source=(https://github.com/bytecodealliance/wasm-micro-runtime/archive/refs/tags/WAMR-$pkgver.tar.gz)
b2sums=('86cb37d4a556e7aed37c715f5498f4280c794c8c2e9cdd8c092653c40f82eb8eaabe52cd42fc4e76f30c5d73b3a43db23aa524477f159c601cc6c51e66372639')

build() {
	cd wasm-micro-runtime-WAMR-$pkgver/product-mini/platforms/linux/
    mkdir build && cd build
    cmake -DCMAKE_INSTALL_PREFIX=$pkgdir/usr -DWAMR_BUILD_DEBUG_INTERP=1 ..
	make
}

package() {
	cd wasm-micro-runtime-WAMR-$pkgver/product-mini/platforms/linux/build
	make install
}
