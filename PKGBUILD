# Maintainer: Lukas Hertel <dev@lukas-hertel.de>
# Maintainer: Quentin Michaud <mh4ckt3mh4ckt1c4s@archlinux.org>
pkgname=iwasm
pkgver=2.2.0
pkgrel=1
pkgdesc="Executable binary built with WAMR VMCore, supporting WASI and CLI"
arch=('x86_64')
url="https://github.com/bytecodealliance/wasm-micro-runtime"
license=('Apache-2.0')
makedepends=('cmake')
source=(https://github.com/bytecodealliance/wasm-micro-runtime/archive/refs/tags/WAMR-$pkgver.tar.gz)
b2sums=('5040c5961b0c421f6eb8f4fa8da74774da4d76eb2f26f8b67f71b4648a02945e66246837c348276ab8375d864ea2b19ee544f96e505cf850394d7f898edce060')

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
