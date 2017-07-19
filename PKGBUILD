# Maintainer: Marcos Ferreira <merkkp at gmail dot com>

pkgname="iqoption-bin"
pkgver=764.3.5959
pkgrel=1
pkgdesc="Ultimate trading experience"
arch=("x86_64")
url="https://iqoption.com"
license=("custom:iqoption")
depends=("sdl2" "sdl2_image" "sdl2_mixer" "mesa" "libnotify")
makedepends=("binutils" "tar")
source=("iqoption.deb::https://updates.iqoption.com/api/v1/build/current/pkg/LinuxGL")
sha256sums=("0d5bce0786c99ddfbe9f88d3b407e343e73457e44f0a6d074f8bef1e4624d2d3")

prepare() {
  tar xf control.tar.gz
}

pkgver() {
  cat control | head -n 2 | tail -n 1 | cut -d' ' -f 2
}

package() {
  tar xf data.tar.xz -C "${pkgdir}/"
}

# vim:set ts=2 sw=2 et:
