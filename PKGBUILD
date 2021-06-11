# Maintainer: Henri D. <nheir.kim@gmail.com>
# Contributor: Andreas B. Wagner <AndreasBWagner@pointfree.net>
# Contributor: Evan Gates <evan.gates@gmail.com>
pkgname=rsstail
pkgver=2.1
pkgrel=3
pkgdesc="Monitor and print rss feeds (tail for rss...)"
license=(GPL2)
arch=('i686' 'x86_64')
url=https://github.com/oldlaptop/rsstail
depends=('libmrss')
makedepends=('git')
source=("$pkgname::git+https://github.com/oldlaptop/rsstail#commit=208a40f14005f26315050d2d9b9444bde6698db0")
md5sums=('SKIP')

build() {
  cd $srcdir/$pkgname
  sed -i -e "s/-liconv_hook //" Makefile
  make
}
package() {
  cd $srcdir/$pkgname
  mkdir -p $pkgdir/usr/{bin,share/man/man1}
  make prefix=$pkgdir/usr install
}

# vim:set ts=2 sw=2 et:
