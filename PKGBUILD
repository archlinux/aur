# Maintainer: bzt <unmacaque at gmail dot com>

pkgname=libretro-tgbdual-git
_gitname=tgbdual-libretro
pkgver=93.4e111be
pkgrel=1
pkgdesc="libretro port of TGB Dual"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/libretro/tgbdual-libretro"
license=('GPL2')
source=("git://github.com/libretro/tgbdual-libretro.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_gitname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "${_gitname}"
  make
}

package() {
  install -Dm644 "${_gitname}/tgbdual_libretro.so" "${pkgdir}/usr/lib/libretro/tgbdual_libretro.so"
}
