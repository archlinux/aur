# Maintainer: Sergey Slipchenko <faergeek@gmail.com>
_gitname=snes9x2002

pkgname=libretro-snes9x2002-git
pkgver=r175.a6cf15d
pkgrel=1
pkgdesc='SNES libretro core heavily optimized for ARM'
arch=('arm' 'armv6h' 'armv7h')
url="https://github.com/libretro/$_gitname"
license=('unknown')
groups=('libretro')
depends=('libretro-core-info')
makedepends=('git')
source=("git+https://github.com/libretro/$_gitname.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_gitname"
  make
}

package() {
  install -Dm644 "$srcdir/$_gitname/snes9x2002_libretro.so" "$pkgdir/usr/lib/libretro/snes9x2002_libretro.so"
}
