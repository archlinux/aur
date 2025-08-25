# Maintainer: EricLin <ericlin050914@gmail.com>

pkgname=wuming
pkgver=0.1
pkgrel=1
pkgdesc="A simple ClamAV GUI frontend"
arch=('any')
url="https://github.com/EricLin0509/WuMing"
license=("GPL-3.0-or-later")
depends=("systemd" "clamav" "glib2" "gtk4" "libadwaita")
makedepends=("git" "meson" "appstream")
provides=("kapitano")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/EricLin0509/WuMing/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('514e19328634b2fdc2b77e6ef3de13e46353145ea58f9fe025635cfb37e18e3b2c9bfd74b9adb0544fbc4c0130a7386ba2b77e0d24064a15a2f65f165263c6d7')

build() {
  opts=()
  arch-meson build "WuMing-${pkgver}" "${opts[@]}"
  meson compile -C build
}

package() {
  meson install --destdir "${pkgdir}" -C build
}

# vim:set sw=2 sts=-1 et:
