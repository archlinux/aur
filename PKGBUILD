# Maintainer: Buce <dmbuce@gmail.com>

pkgname=norbert
pkgver=0.5
pkgrel=1
pkgdesc="A command line NBT editor."
arch=(any)
url="https://github.com/DMBuce/norbert"
license=('GPL2')
groups=()
depends=(python python-nbt)
makedepends=('git')
backup=()
options=()
install=
source=("$pkgname::git://github.com/DMBuce/$pkgname.git#tag=$pkgver")
#source=("$pkgname::git+ssh://git@mantrid/~/$pkgname.git#tag=$pkgver")
noextract=()
md5sums=(SKIP)

build() {
  cd "$srcdir/$pkgname"
  cd doc
  make
}

package() {
  cd "$srcdir/$pkgname"
  install -D -m755 norbert.py "$pkgdir/usr/bin/norbert"
  install -D -m755 vinbt "$pkgdir/usr/bin/vinbt"
  cd doc
  make mandir=/usr/share/man DESTDIR="$pkgdir" doc-install
}

# vim:set ts=2 sw=2 et:
