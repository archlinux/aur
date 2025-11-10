# Maintainer: EricLin <ericlin050914@gmail.com>

pkgname=wuming
pkgver=0.3.1
pkgrel=2
pkgdesc="A simple ClamAV GUI frontend"
arch=('any')
url="https://github.com/EricLin0509/WuMing"
license=("GPL-3.0-or-later")
depends=("systemd" "clamav" "glib2" "gtk4" "libadwaita")
makedepends=("git" "meson" "appstream")
provides=("wuming")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/EricLin0509/WuMing/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('d60f59a6ab12ab118af642a3bcfa26f28dd00fefe49f93497d179f3c9e553e13ef54ea210bc780b78b306f83c5e625b909ece87a49686d773831d69711567dd3')

build() {
  opts=()
  arch-meson build "WuMing-${pkgver}" "${opts[@]}"
  meson compile -C build
}

package() {
  meson install --destdir "${pkgdir}" -C build
}

# vim:set sw=2 sts=-1 et:
