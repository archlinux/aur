# Maintainer: Entith <entith@entith.net>
# Contributor: Vorpal <vorpal@riseup.net>
pkgname=vkdevicechooser
pkgver=1.0
pkgrel=2
pkgdesc="Vulkan layer to force a specific physical GPU device to be used"
arch=('x86_64')
url="https://github.com/aejsmith/vkdevicechooser"
license=('MIT')
depends=('vulkan-icd-loader')
makedepends=('git' 'vulkan-headers' 'vulkan-validation-layers' 'meson' 'ninja')
source=(https://github.com/aejsmith/vkdevicechooser/archive/refs/tags/1.0.zip)
md5sums=('5555405659067e6ba80fac37fcd556d4')

build() {
  cd "${pkgname}-${pkgver}"
  meson --prefix=/usr build
  ninja -C build
}

package() {
  cd "${pkgname}-${pkgver}"
  echo "pkgdir $pkgdir"
  DESTDIR="$pkgdir" ninja -C build install
}
