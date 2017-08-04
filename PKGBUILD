# Maintainer: Marcos Ferreira <merkkp at gmail dot com>

pkgname="iqoption-bin"
pkgver=778.5.7351
pkgrel=1
pkgdesc="Ultimate trading experience"
arch=("x86_64")
url="https://iqoption.com"
license=("custom:iqoption")
depends=("sdl2" "sdl2_image" "sdl2_mixer" "mesa" "libnotify")
makedepends=("binutils" "tar")
source=("iqoption.deb::https://updates.iqoption.com/api/v1/build/current/pkg/LinuxGL")
sha256sums=("93d15f07e95a7748b032b12056d92ee79bfb0fe37268372e8746225309c71f93")

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
