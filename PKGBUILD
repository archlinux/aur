# Maintainer: Niels Desmet <parasait@proton.me>
pkgname=awesomenes
pkgver="0.7.3"
pkgrel=1
pkgdesc="A NES emulator with ROM debugging and hacking toolchain written in C"
arch=('x86_64')
url='https://gitlab.com/ParaSait/awesomenes'
license=('MIT')
makedepends=('meson' 'gzip' 'flex' 'bison')
depends=('sdl2-compat' 'libinih' 'libpng')
source=("https://gitlab.com/ParaSait/awesomenes/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('44edd70d629a6cfcabc7e52a1dee4bab48efa18daa0e82dda79e3f7777fda0b7')
sourcedir="${pkgname}-${pkgver}"

build() {
  arch-meson build "$sourcedir"
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
