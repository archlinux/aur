# Maintainer: crimist <aur at crim dot ist>
# Contributor: skrewball <aur at joickle dot com>

pkgname=gnome-shell-extension-color-picker
pkgver=51.0
pkgrel=1
pkgdesc='Simple color picker for Gnome Shell'
arch=(any)
url='https://github.com/tuberry/color-picker'
license=('GPL3')
depends=('dconf' 'gnome-shell')
makedepends=('meson' 'sassc')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('94ec4394db4a3a8a931aabe26efe9b18e12cb57dd4fea62d4864d4ae39acb127')

build() {
  arch-meson "color-picker-${pkgver}" build --reconfigure -Dtarget=system
}

package() {
  meson install -C build --destdir "$pkgdir"
}
