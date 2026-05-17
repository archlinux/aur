# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=vulkan-low-latency-layer
pkgver=0.1.0
pkgrel=1
pkgdesc='Implicit Vulkan layer that reduces click-to-photon latency for AMD and NVidia.'
url="https://github.com/Korthos-Software/low_latency_layer/"
license=('MIT')
depends=()
makedepends=('cmake' 'vulkan-headers' 'vulkan-utility-libraries')
arch=('x86_64')
sha256sums=('425f673fb7cd238231004b2cd39eb5db320c8cac9560b5fcafc99d8a36702fed')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")

_srcdir="low_latency_layer-$pkgver"

build() {
	cmake -S "${_srcdir}" -B build -DCMAKE_BUILD_TYPE=None -DCMAKE_INSTALL_PREFIX=/usr
	cmake --build build
}

package() {
	DESTDIR="${pkgdir}" cmake --install build
}
