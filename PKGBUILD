# Maintainer: Marcos Ferreira <merkkp at gmail dot com>

pkgname="iqoption-bin"
pkgver=794.5.8347
pkgrel=1
pkgdesc="Ultimate trading experience"
arch=("x86_64")
url="https://iqoption.com"
license=("custom:iqoption")
depends=("sdl2" "sdl2_image" "sdl2_mixer" "mesa" "libnotify")
makedepends=("binutils" "tar")
source=("iqoption.deb::https://updates.iqoption.com/api/v1/build/current/pkg/LinuxGL")
sha256sums=("SKIP")

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
