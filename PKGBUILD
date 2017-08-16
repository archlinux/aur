pkgname=blarb
pkgver="1.0.0"
pkgrel=1
pkgdesc="The Blarb programming language."
arch=('x86_64')
url="https://github.com/elimirks/BlarbVM"
license=('ISC')
depends=()
makedepends=('flex' 'gcc' 'git' 'make')
provides=('blarb')
conflicts=('blarb')
backup=('etc/xdg/blarb/config')
source=("git://github.com/elimirks/BlarbVM.git")
md5sums=('SKIP')
_gitname="BlarbVM"

prepare() {
  cd "$srcdir/$_gitname"
	git checkout $pkgver
}

build() {
  cd "$srcdir/$_gitname"
	make
}

package() {
  cd "$srcdir/$_gitname"
  mkdir -p "$pkgdir/usr/bin"
  install -D -m755 ./blarb "$pkgdir/usr/bin/blarb"
}
