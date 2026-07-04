# Maintainer: Niels Desmet <parasait@proton.me>
pkgname=awesomenes
pkgver="0.7.1"
pkgrel=1
pkgdesc="A NES emulator with ROM debugging and hacking toolchain written in C"
arch=('x86_64')
url='https://gitlab.com/ParaSait/awesomenes'
license=('MIT')
makedepends=('meson' 'gzip' 'flex' 'bison')
depends=('sdl2-compat' 'libinih' 'libpng')
source=("https://gitlab.com/ParaSait/awesomenes/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('08e374b8a1440ab576d85cbd12cf6083db80378c97e53279a1d7ad65684bf7c3')
sourcedir="${pkgname}-${pkgver}"

build() {
  arch-meson build "$sourcedir"
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
