# Maintainer: EricLin <ericlin050914@gmail.com>

pkgname=wuming
pkgver=0.1.1
pkgrel=1
pkgdesc="A simple ClamAV GUI frontend"
arch=('any')
url="https://github.com/EricLin0509/WuMing"
license=("GPL-3.0-or-later")
depends=("systemd" "clamav" "glib2" "gtk4" "libadwaita")
makedepends=("git" "meson" "appstream")
provides=("wuming")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/EricLin0509/WuMing/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('4125c0d0ce83290eedcbfc1d77d9b37b16a1e87405c3329f2bad19ec82bfd1ea9650286e318347b9fb345dc489570375886521e422525b2c9980e71624ef5b87')

build() {
  opts=()
  arch-meson build "WuMing-${pkgver}" "${opts[@]}"
  meson compile -C build
}

package() {
  meson install --destdir "${pkgdir}" -C build
}

# vim:set sw=2 sts=-1 et:
