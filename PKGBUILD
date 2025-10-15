# Maintainer: crimist <aur at crim dot ist>
# Contributor: skrewball <aur at joickle dot com>

pkgname=gnome-shell-extension-color-picker
pkgver=49.0
pkgrel=1
pkgdesc='Simple color picker for Gnome Shell'
arch=(any)
url='https://github.com/tuberry/color-picker'
license=('GPL3')
depends=('dconf' 'gnome-shell')
makedepends=('meson' 'sassc')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('f925fe29689a7a2c615fdeb6b2de81cb1db1ba33872077007e540f45e098ce99aa8b4afb9e3b32ad2a75c9895101b7a1f44b60d8f6795caba463b82b09c1c3cf')

build() {
  arch-meson "color-picker-${pkgver}" build --reconfigure -Dtarget=system
}

package() {
  meson install -C build --destdir "$pkgdir"
}
