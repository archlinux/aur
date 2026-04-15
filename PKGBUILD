# Maintainer: crimist <aur at crim dot ist>
# Contributor: skrewball <aur at joickle dot com>

pkgname=gnome-shell-extension-color-picker
pkgver=50.1
pkgrel=1
pkgdesc='Simple color picker for Gnome Shell'
arch=(any)
url='https://github.com/tuberry/color-picker'
license=('GPL3')
depends=('dconf' 'gnome-shell')
makedepends=('meson' 'sassc')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('8914062c18f894ecb074fccc5932d4ed2cfb7975fc2744303bbfd2a52641b92b')

build() {
  arch-meson "color-picker-${pkgver}" build --reconfigure -Dtarget=system
}

package() {
  meson install -C build --destdir "$pkgdir"
}
