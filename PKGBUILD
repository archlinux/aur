# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>
# Maintainer: Ivan Wheeler <ivanwheeler90 at gmail dot com>

pkgname=vkoverhead
pkgver=1.3
pkgrel=1
pkgdesc="Tool for evaluating CPU-based overhead of Vulkan drivers"
url="https://github.com/zmike/vkoverhead"
arch=(x86_64)
license=(MIT)
makedepends=(meson ninja python python-mako)
depends=(vulkan-driver)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f7f13a91a09f29b7b63a4963c7bd4c01520cc0db9daf66912ae8e2f16dcdb377')

build() {
  arch-meson $pkgname-$pkgver build
  ninja -C build
}

package() {
  install -Dm755 build/vkoverhead "$pkgdir"/usr/bin/vkoverhead
  install -Dm755 build/foz_parse "$pkgdir"/usr/bin/foz_parse
}
