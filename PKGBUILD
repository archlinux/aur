# Maintainer: Quentin MICHAUD <mh4ckt3mh4ckt1c4s@archlinux.org>
# Contributor: Po-An, Yang (Antonio Yang) <yanganto at gmail.com>
# Contributor: tee < teeaur at duck dot com >
pkgname=wasmedge
pkgver=0.18.1
pkgrel=1
pkgdesc='A lightweight, high-performance, and extensible WebAssembly runtime'
arch=('x86_64')
url='https://wasmedge.org'
license=('Apache-2.0')
makedepends=('llvm' 'lld' 'cmake' 'ninja' 'spdlog')
depends=('fmt' 'glibc' 'libgcc' 'libstdc++' 'lld' 'llvm-libs' 'spdlog')
source=("$pkgname-$pkgver.tar.gz::https://github.com/WasmEdge/WasmEdge/releases/download/$pkgver/WasmEdge-$pkgver-src.tar.gz")
sha256sums=('589031c828628fbae8576e9d6ef497ac9888bca964dacacaa79ad9c82f9538bc')

build() {
	cd "$pkgname"
	cmake -B build -G Ninja -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr" .
	ninja -C build
}

package() {
	cd "$pkgname"
	ninja -C build install
}

