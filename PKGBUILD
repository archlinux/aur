# Maintainer: EricLin <ericlin050914@gmail.com>

pkgname=wuming
pkgver=0.2.beta1
pkgrel=1
pkgdesc="A simple ClamAV GUI frontend"
arch=('any')
url="https://github.com/EricLin0509/WuMing"
license=("GPL-3.0-or-later")
depends=("systemd" "clamav" "glib2" "gtk4" "libadwaita")
makedepends=("git" "meson" "appstream")
provides=("wuming")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/EricLin0509/WuMing/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('c68e2f838509b46b325487717e51a9fe880d1bf3ac14677ab24f301e3b82e03c6d55855eabb655d28dd1674a0346b310c327f09a81c5f0bb6fe12367c3213e98')

build() {
  opts=()
  arch-meson build "WuMing-${pkgver}" "${opts[@]}"
  meson compile -C build
}

package() {
  meson install --destdir "${pkgdir}" -C build
}

# vim:set sw=2 sts=-1 et:
