# Maintainer: crimist <aur at crim dot ist>
# Contributor: skrewball <aur at joickle dot com>

pkgname=gnome-shell-extension-color-picker
pkgver=51.1
pkgrel=1
pkgdesc='Simple color picker for Gnome Shell'
arch=(any)
url='https://github.com/tuberry/color-picker'
license=('GPL3')
depends=('dconf' 'gnome-shell')
makedepends=('meson' 'sassc')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('755538d26227fa570144d776624ad891dafe8d88f78afe186da703fc52d66596')

build() {
  arch-meson "color-picker-${pkgver}" build --reconfigure -Dtarget=system
}

package() {
  meson install -C build --destdir "$pkgdir"
}
