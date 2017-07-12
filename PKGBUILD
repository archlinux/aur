# Maintainer: Oliver Jaksch <arch-aur@com-in.de>

pkgname=libretro-database-git
pkgver=1420.400b69f
pkgrel=1
pkgdesc="Repository containing cheatcode files, content data files, etc."
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="https://github.com/libretro/libretro-database"
license=('GPL3')
groups=('libretro')
depends=('zlib')
makedepends=('git')

_libname=4do_libretro
_gitname=libretro-database
source=("git+https://github.com/libretro/${_gitname}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_gitname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  mkdir -p ${pkgdir}/usr/lib/libretro
  rm -rf ${srcdir}/${_gitname}/.git/
  cp -a "${srcdir}/${_gitname}/" "${pkgdir}/usr/lib/libretro/"
}
