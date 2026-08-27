# Maintainer: Niels Desmet <parasait@proton.me>
pkgname=awesomenes
pkgver="0.9_alpha.1"
_pkgver="0.9-alpha.1"
pkgrel=1
pkgdesc="A NES emulator with ROM debugging and hacking toolchain written in C"
arch=('x86_64')
url='https://gitlab.com/ParaSait/awesomenes'
license=('MIT')
makedepends=('meson' 'gzip' 'flex' 'bison')
depends=('sdl2-compat' 'sdl2_ttf' 'libinih' 'libpng' 'libedit' 'lua')
source=("https://gitlab.com/ParaSait/awesomenes/-/archive/${_pkgver}/${pkgname}-${_pkgver}.tar.gz")
sha256sums=('0f777128b12cfde5c02b19aa78b5f8cc19cc6be5ca0225eecbd2dded56cfb092')
sourcedir="${pkgname}-${_pkgver}"

build() {
  arch-meson build "$sourcedir"
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
