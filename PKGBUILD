# Maintainer: Niels Desmet <parasait@proton.me>
pkgname=awesomenes
pkgver="0.9_alpha.2"
_pkgver="0.9-alpha.2"
pkgrel=1
pkgdesc="A NES emulator with ROM debugging and hacking toolchain written in C"
arch=('x86_64')
url='https://gitlab.com/ParaSait/awesomenes'
license=('MIT')
makedepends=('meson' 'gzip' 'flex' 'bison')
depends=('sdl2-compat' 'sdl2_ttf' 'libinih' 'libpng' 'libedit' 'lua')
source=("https://gitlab.com/ParaSait/awesomenes/-/archive/${_pkgver}/${pkgname}-${_pkgver}.tar.gz")
sha256sums=('9f6ad7038e983f5325e5979a98ea1f8a802f0da5527e8579caf0a623b2689a42')
sourcedir="${pkgname}-${_pkgver}"

build() {
  arch-meson build "$sourcedir"
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
