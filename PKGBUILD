# Maintainer: jiriks74 <jiri.stefka@atlas.cz>
# Credits: Entith <entith@entith.net>
pkgname=vkdevicechooser-git
pkgver=1.1
pkgrel=1
pkgdesc="Vulkan layer to force a specific physical GPU device to be used"
arch=('x86_64')
url="https://github.com/jiriks74/vkdevicechooser"
license=('MIT')
depends=('vulkan-icd-loader')
makedepends=('git' 'vulkan-headers' 'vulkan-utility-libraries' 'meson' 'ninja')
conflicts=('vkdevicechooser')
source=(git+https://github.com/jiriks74/vkdevicechooser.git)
sha256sums=('SKIP')

build() {
  cd "vkdevicechooser"
  meson --prefix=/usr build
  ninja -C build
}

package() {
  cd "vkdevicechooser"
  echo "pkgdir $pkgdir"
  DESTDIR="$pkgdir" ninja -C build install
}

