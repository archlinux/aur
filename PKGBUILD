# Maintainer: Leif Warner <abimelech@gmail.com>
pkgname=idris-sdl-git
pkgver=28.c71dd53
pkgrel=1
pkgdesc="SDL bindings package for Idris."
url="https://github.com/edwinb/SDL-idris"
license=('custom:BSD3')
arch=('i686' 'x86_64')
depends=('idris' 'sdl_gfx')
provides=('idris-sdl')
conflicts=('idris-sdl')
source=('git://github.com/edwinb/SDL-idris.git')
md5sums=('SKIP')
_gitname=SDL-idris

pkgver() {
  cd $_gitname
  echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}
build() {
  cd $_gitname
  idris --build sdl.ipkg
}
package() {
  cd $_gitname
  TARGET=$pkgdir`idris --libdir` idris --install sdl.ipkg
}
