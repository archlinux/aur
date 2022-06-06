# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Allan McRae <allan@archlinux.com>
# Contributor: gyo <nucleogeek@gmail.com>

pkgname=sdl2_pango
pkgver=0.1.2
pkgrel=1
pkgdesc="Connects Pango to SDL2"
arch=("x86_64")
url="https://github.com/markuskimius/SDL2_Pango"
license=("LGPL")
depends=("pango" "sdl2")
makedepends=("git")
_commit=748d126fb6900107e6344ee962b8b48e2b73c88e
source=("sdl2_pango-$_commit::git+$url.git#commit=$_commit")
sha256sums=(SKIP)

build() {
  cd "$srcdir/$pkgname-$_commit"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$_commit"
  make DESTDIR="$pkgdir" install
}
