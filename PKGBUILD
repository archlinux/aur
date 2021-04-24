# Maintainer: Cyano Hao <c@cyano.cn>

pkgname=directx-headers
pkgdesc="DirectX headers for mesa-wslg"
pkgver=1.4.9
pkgrel=1
arch=('x86_64' 'aarch64')
makedepends=('meson')
url="https://github.com/microsoft/DirectX-Headers"
license=('MIT')
source=(https://github.com/microsoft/DirectX-Headers/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('a30fb05ba012343a7aa42afb5c32c6474f15c18d3650438ecee7ce2092806195')

build() {
  LDFLAGS="-L/usr/lib/wsl/lib" arch-meson DirectX-Headers-$pkgver build
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
