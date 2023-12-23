# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Yamashiro <dev cosmicheron com>

pkgname=yamagi-quake2-ref_vk
pkgver=1.0.7
pkgrel=2
arch=('i686' 'x86_64')
pkgdesc="Vulkan renderer for yamagi-quake2"
url="https://github.com/yquake2/ref_vk/"
license=('GPL' 'custom')
depends=('yamagi-quake2')
makedepends=('vulkan-headers')
source=("${pkgname##*-}-$pkgver.tar.gz"::"https://github.com/yquake2/${pkgname##*-}/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('afa9a38eab633ed5193584c679e5c1e200b892a6d699024718238a47c17b7de7')

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
