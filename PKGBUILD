# Maintainer: EricLin <ericlin050914@gmail.com>

pkgname=wuming
pkgver=1.0
pkgrel=1
pkgdesc="A simple ClamAV GUI frontend"
arch=('any')
url="https://github.com/EricLin0509/WuMing"
license=("GPL-3.0-or-later")
depends=("systemd" "clamav" "glib2" "gtk4" "libadwaita")
makedepends=("git" "meson" "appstream")
provides=("wuming")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/EricLin0509/WuMing/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('33dbcee31ade16da84cd3de2556ab72bed1ee8f4171d7f6e2784a2dfe48d5c3508fb0f0ef441739486d8b197c06ce594db9ae010a504899dfdf81cba17651345')

build() {
  opts=()
  arch-meson build "WuMing-${pkgver}" "${opts[@]}"
  meson compile -C build
}

package() {
  meson install --destdir "${pkgdir}" -C build
}

# vim:set sw=2 sts=-1 et:
