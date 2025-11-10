# Maintainer: EricLin <ericlin050914@gmail.com>

pkgname=wuming
pkgver=0.3.1
pkgrel=1
pkgdesc="A simple ClamAV GUI frontend"
arch=('any')
url="https://github.com/EricLin0509/WuMing"
license=("GPL-3.0-or-later")
depends=("systemd" "clamav" "glib2" "gtk4" "libadwaita")
makedepends=("git" "meson" "appstream")
provides=("wuming")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/EricLin0509/WuMing/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('34ad026baa4b04f03dab5e05080a38b53257b534d3a79743e4f8f9d3eee50b81aa1812ee6c57a119c222d448273307b41a114b99ecd7f850fe1f0ff6cd0b61b0')

build() {
  opts=()
  arch-meson build "WuMing-${pkgver}" "${opts[@]}"
  meson compile -C build
}

package() {
  meson install --destdir "${pkgdir}" -C build
}

# vim:set sw=2 sts=-1 et:
