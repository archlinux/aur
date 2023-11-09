# Maintainer: jiriks74 <jiri@stefka.eu>
# Old maintainer: Entith <entith@entith.net>
pkgname=vkdevicechooser
pkgver=1.1
pkgrel=1
pkgdesc="Vulkan layer to force a specific physical GPU device to be used"
arch=('x86_64')
url="https://github.com/jiriks74/vkdevicechooser"
license=('MIT')
depends=('vulkan-icd-loader')
makedepends=('git' 'vulkan-headers' 'vulkan-utility-libraries' 'meson' 'ninja')
conflicts=('vkdevicechooser-git')
source=(https://github.com/jiriks74/vkdevicechooser/archive/refs/tags/1.1.zip)
md5sums=('b838ff799b1e729e11d1b950504672be')

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
