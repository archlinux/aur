# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: Herr_Irrtum

pkgname=huexpress-git
_pkgname=huexpress
pkgver=r197.863fd1b
pkgrel=2
pkgdesc="A PCEngine emulator forked from Hu-Go!"
url="https://github.com/kallisti5/huexpress"
depends=('libzip' 'glu' 'sdl2_mixer')
makedepends=('git' 'gendesk' 'scons')
conflicts=(huexpress)
license=('GPL')
arch=('x86_64' 'i686')
source=("${pkgname}"::'git+https://github.com/kallisti5/huexpress.git')
md5sums=('SKIP')

build() {
  cd ${srcdir}/${pkgname}
  scons
}

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd ${srcdir}/${pkgname}
  install -Dm755 "${srcdir}/${pkgname}/src/huexpress" "$pkgdir/usr/bin/huexpress"
}

# vim:set ts=2 sw=2 et:
