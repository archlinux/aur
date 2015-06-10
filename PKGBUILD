# Maintainer: 
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Jeff Mickey <j@codemac.net>

pkgname=tdl
pkgver=1.5.2
pkgrel=7
pkgdesc='TODO list manager'
arch=('x86_64' 'i686')
url='https://github.com/rc0/tdl'
license=('GPL')
depends=('readline')
makedepends=('git')
source=("$pkgname::git://github.com/T-J-Teru/tdl.git#commit=382c52a2d1f2d064110c189459fe09a6edb12761" 'readline63.patch')
md5sums=('SKIP'
         'dada1488632f9d672e75e15cfb011ecb')

prepare() {
  cd "$pkgname"

  patch -p1 -i "$srcdir/readline63.patch"
}

build() {
  cd "$pkgname"

  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  make -C "$pkgname" DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
