# Maintainer: Lukas Hertel <dev@lukas-hertel.de>
# Maintainer: Quentin Michaud <mh4ckt3mh4ckt1c4s@archlinux.org>
pkgname=iwasm
pkgver=2.3.1
pkgrel=1
pkgdesc="Executable binary built with WAMR VMCore, supporting WASI and CLI"
arch=('x86_64')
url="https://github.com/bytecodealliance/wasm-micro-runtime"
license=('Apache-2.0')
makedepends=('cmake' 'git')
source=(https://github.com/bytecodealliance/wasm-micro-runtime/archive/refs/tags/WAMR-$pkgver.tar.gz)
b2sums=('0a276b9267800f8ade6dc2f92d8922c30ba9ff36a59d2ef2aef44db78b89e6d803e63612971ea550708e3ed00f838a98977c5290446f477c1a8189f279e7e3a5')

build() {
	cd wasm-micro-runtime-WAMR-$pkgver/product-mini/platforms/linux/
    mkdir build && cd build
    cmake -DCMAKE_INSTALL_PREFIX=$pkgdir/usr ..
	make
}

package() {
	cd wasm-micro-runtime-WAMR-$pkgver/product-mini/platforms/linux/build
	make install
}
