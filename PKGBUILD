# Maintainer: Lukas Hertel <dev@lukas-hertel.de>
# Maintainer: Quentin Michaud <mh4ckt3mh4ckt1c4s@archlinux.org>
pkgname=iwasm
pkgver=2.4.2
pkgrel=1
pkgdesc="Executable binary built with WAMR VMCore, supporting WASI and CLI"
arch=('x86_64')
url="https://github.com/bytecodealliance/wasm-micro-runtime"
license=('Apache-2.0')
makedepends=('cmake' 'git')
source=(https://github.com/bytecodealliance/wasm-micro-runtime/archive/refs/tags/WAMR-$pkgver.tar.gz)
b2sums=('ed41fae4c3d3295ecd430b8a904349176d63abf21a5b4dce3fce9453310d0dd9dd8f8b19e8fd51290c7e4807af33821d11c7fd52cf15e25825bdf335448f6301')

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
