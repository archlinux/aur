# Maintainer: bzt <unmacaque at gmail dot com>

pkgname=libretro-tgbdual-git
_gitname=tgbdual-libretro
pkgver=69.b1bf294
pkgrel=1
pkgdesc="libretro port of TGB Dual"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/libretro/tgbdual-libretro"
license=('GPL2')
source=("git://github.com/libretro/tgbdual-libretro.git"
        "https://raw.github.com/libretro/libretro-super/master/dist/info/tgbdual_libretro.info")

md5sums=('SKIP'
         'SKIP')

pkgver() {
  cd "${_gitname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "${_gitname}"
  make
}

package() {
  install -Dm644 "${srcdir}/tgbdual_libretro.info" "${pkgdir}/usr/lib/libretro/tgbdual_libretro.info"
  install -Dm644 "${_gitname}/tgbdual_libretro.so" "${pkgdir}/usr/lib/libretro/tgbdual_libretro.so"
}
