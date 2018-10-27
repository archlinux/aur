# Maintainer: asm0dey <pavel.finkelshtein+AUR@gmail.com>
pkgname=downgrader-git
_pkgver=2.0.0
pkgver=2.0.0.r158.f346695
pkgrel=3
pkgdesc="Powerful packages downgrader for Archlinux. Works with libalpm, ARM and pacman logs"
arch=('i686' 'x86_64')
license=("GPL")
_gitname=Archlinux-downgrader

url="https://github.com/DimaSmirnov/$_gitname"
source=("git+https://github.com/DimaSmirnov/$_gitname.git")
md5sums=('SKIP')
depends=('pacman' 'pacman-contrib')
makedepends=('git')
provides=("downgrader")
conflicts=('downgrader')

pkgver() {
  cd "$_gitname"
  printf "$_pkgver.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $_gitname
  make
}

package() {
  cd $_gitname
  install -D -m755 downgrader "$pkgdir/usr/bin/downgrader"
}


