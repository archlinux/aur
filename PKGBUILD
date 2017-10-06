# Maintainer: Oliver Jaksch <arch-aur@com-in.de>

pkgname=libretro-database-git
pkgver=1516.6fc94a75
pkgrel=1
pkgdesc="Repository containing cheatcode files, content data files, etc."
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="https://github.com/libretro/libretro-database"
license=('GPL3')
groups=('libretro')
depends=('zlib')
makedepends=('git')

_libname=database
_gitname=libretro-database
source=("git+https://github.com/libretro/${_gitname}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_gitname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  mkdir -p ${pkgdir}/usr/share/libretro/${_libname}/
  mv ${srcdir}/${_gitname}/* ${pkgdir}/usr/share/libretro/${_libname}/
  rm ${pkgdir}/usr/share/libretro/${_libname}/Makefile ${pkgdir}/usr/share/libretro/${_libname}/configure
}
