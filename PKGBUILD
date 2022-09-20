# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=vkoverhead
pkgver=1.1
pkgrel=1
pkgdesc="Tool for evaluating CPU-based overhead of Vulkan drivers"
url="https://github.com/zmike/vkoverhead"
arch=(x86_64)
license=(MIT)
makedepends=(meson ninja python)
depends=(vulkan-driver)
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7752291a4e5aa0b6e181959cb34916940569d10e91dbc92a77bee3f53ea2224d')

build() {
  arch-meson $pkgname-$pkgver build
  ninja -C build
}

package() {
  install -Dm755 build/vkoverhead "$pkgdir"/usr/bin/vkoverhead
}
