# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=yamagi-quake2-ref_vk
pkgver=1.0.2
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Vulkan renderer for yamagi-quake2"
url="https://github.com/yquake2/ref_vk/"
license=('GPL' 'custom')
depends=('yamagi-quake2')
source=("${pkgname##*-}-$pkgver.tar.gz"::"https://github.com/yquake2/${pkgname##*-}/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ca1be2a53ec24cddd9858e10263722b3716af7bb8fa2a16c90cfd9419b160e8f')

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
