# Maintainer: EricLin <ericlin050914@gmail.com>

pkgname=wuming
pkgver=0.2.beta3
pkgrel=1
pkgdesc="A simple ClamAV GUI frontend"
arch=('any')
url="https://github.com/EricLin0509/WuMing"
license=("GPL-3.0-or-later")
depends=("systemd" "clamav" "glib2" "gtk4" "libadwaita")
makedepends=("git" "meson" "appstream")
provides=("wuming")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/EricLin0509/WuMing/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('689284e2674bcee7cc3c72e5fac1d60568399ec9afd8e030a9f9092ddbe55675646ca8b6a1fe1fcd0da962751ab1bb9410de4757b95e7034babf31c353be7696')

build() {
  opts=()
  arch-meson build "WuMing-${pkgver}" "${opts[@]}"
  meson compile -C build
}

package() {
  meson install --destdir "${pkgdir}" -C build
}

# vim:set sw=2 sts=-1 et:
