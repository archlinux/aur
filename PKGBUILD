# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=vkoverhead
pkgver=1.2
pkgrel=1
pkgdesc="Tool for evaluating CPU-based overhead of Vulkan drivers"
url="https://github.com/zmike/vkoverhead"
arch=(x86_64)
license=(MIT)
makedepends=(meson ninja python python-mako)
depends=(vulkan-driver)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9b105cb218b66f26552a9055a70fe20ff239b891762f650a19d78bfe24ab0d22')

build() {
  arch-meson $pkgname-$pkgver build
  ninja -C build
}

package() {
  install -Dm755 build/vkoverhead "$pkgdir"/usr/bin/vkoverhead
  install -Dm755 build/foz_parse "$pkgdir"/usr/bin/foz_parse
}
