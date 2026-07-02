# Maintainer: Niels Desmet <parasait@proton.me>
pkgname=awesomenes
pkgver="0.7"
pkgrel=1
pkgdesc="A NES emulator with ROM debugging and hacking toolchain written in C"
arch=('x86_64')
url='https://gitlab.com/ParaSait/awesomenes'
license=('MIT')
makedepends=('meson' 'flex' 'bison')
depends=('sdl2-compat' 'libinih' 'libpng')
source=("https://gitlab.com/ParaSait/awesomenes/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('3d2f5bb2d1a7fe9755864d81aacbb2f894e6f8ef3e40a1378e84945b104c9a6d')
sourcedir="${pkgname}-${pkgver}"

build() {
  arch-meson build "$sourcedir"
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
