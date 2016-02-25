# Maintainer: Henri D. <nheir.kim@gmail.com>
# Contributor: Andreas B. Wagner <AndreasBWagner@pointfree.net>
# Contributor: Evan Gates <evan.gates@gmail.com>
pkgname=rsstail
pkgver=2.1
pkgrel=1
pkgdesc="Monitor and print rss feeds (tail for rss...)"
license=(GPL2)
arch=('i686' 'x86_64')
url=http://www.vanheusden.com/rsstail/
depends=('libmrss')
source=("http://www.vanheusden.com/rsstail/$pkgname-$pkgver.tgz")
md5sums=('03f11f9f9a4f78adcf2ecf430fba8291')

build() {
  cd $srcdir/$pkgname-$pkgver
  sed -i -e "s/-liconv_hook //" Makefile
  make
}
package() {
  cd $srcdir/$pkgname-$pkgver
  mkdir -p $pkgdir/usr/{bin,share/man/man1}
  make prefix=$pkgdir/usr install
}

# vim:set ts=2 sw=2 et:
