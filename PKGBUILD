pkgname=libretro-beetle-saturn-git
_gitname=beetle-saturn-libretro
pkgver=495.3313cc6
pkgrel=1
pkgdesc="libretro port of Mednafen Saturn"
arch=('x86_64')
url="https://github.com/libretro/beetle-saturn-libretro"
license=('GPLv2')
makedepends=('git')
depends=('libglvnd' 'clang')
source=("${_gitname}::git://github.com/libretro/${_gitname}.git")
groups=('libretro')

md5sums=('SKIP')

pkgver() {
  cd "${_gitname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "${_gitname}"
  make
}

package() {
  install -Dm644 "${_gitname}/mednafen_saturn_libretro.so" "${pkgdir}/usr/lib/libretro/mednafen_saturn_libretro.so"
}
