# Maintainer: Quentin MICHAUD <mh4ckt3mh4ckt1c4s@archlinux.org>
# Contributor: Po-An, Yang (Antonio Yang) <yanganto at gmail.com>
# Contributor: tee < teeaur at duck dot com >
pkgname=wasmedge
pkgver=0.16.1
pkgrel=1
pkgdesc='A lightweight, high-performance, and extensible WebAssembly runtime'
arch=('x86_64')
url='https://wasmedge.org'
license=('Apache-2.0')
makedepends=('llvm' 'lld' 'cmake' 'ninja' 'spdlog')
depends=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/WasmEdge/WasmEdge/releases/download/$pkgver/WasmEdge-$pkgver-src.tar.gz")
sha256sums=('fc256b8be022eb0487549cc2119c57fd12ad402e4130a05263b7aa85e2df89b9')

build() {
	cd "$pkgname"
	cmake -B build -G Ninja -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr" .
	ninja -C build
}

package() {
	cd "$pkgname"
	ninja -C build install
}

