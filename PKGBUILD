# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=yamagi-quake2-ref_vk
pkgver=1.0.5
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Vulkan renderer for yamagi-quake2"
url="https://github.com/yquake2/ref_vk/"
license=('GPL' 'custom')
depends=('yamagi-quake2')
makedepends=('vulkan-headers')
source=("${pkgname##*-}-$pkgver.tar.gz"::"https://github.com/yquake2/${pkgname##*-}/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f1f930ff900908c2caeb1b66a6c17b2fdd4272cdeb61253d0342f0e28c26290e')

build() {
  make -C ${pkgname##*-}-$pkgver
}

package() {
  cd ${pkgname##*-}-$pkgver

  # library
  install -Dm644 release/ref_vk.so "$pkgdir"/usr/lib/yamagi-quake2/ref_vk.so

  # doc
  install -Dm644 README.md "$pkgdir"/usr/share/doc/$pkgname/README.md

  # license
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
