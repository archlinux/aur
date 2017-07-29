# Maintainer: Marcos Ferreira <merkkp at gmail dot com>

pkgname="iqoption-bin"
pkgver=772.14.6877
pkgrel=1
pkgdesc="Ultimate trading experience"
arch=("x86_64")
url="https://iqoption.com"
license=("custom:iqoption")
depends=("sdl2" "sdl2_image" "sdl2_mixer" "mesa" "libnotify")
makedepends=("binutils" "tar")
source=("iqoption.deb::https://updates.iqoption.com/api/v1/build/current/pkg/LinuxGL")
sha256sums=("759f43d7b8bdf085cc5c6ab10d7d534d00956fb58b68363c2e815ce8bc106437")

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
