# Maintainer: Henri D. <nheir.kim@gmail.com>
# Contributor: Andreas B. Wagner <AndreasBWagner@pointfree.net>
# Contributor: Evan Gates <evan.gates@gmail.com>
pkgname=rsstail
pkgver=2.2
pkgrel=1
pkgdesc="Monitor and print rss feeds (tail for rss...)"
license=(GPL2)
arch=('i686' 'x86_64')
url=https://github.com/folkertvanheusden/rsstail
depends=('libmrss')
makedepends=('git')
source=("https://github.com/folkertvanheusden/rsstail/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('55310b92fd09a33d0d453b025e7fe66a1b7884bf1a2c9f3ea31823bfb15f623df53a0095d8e25b0415e299a2142f65fc9e783b3b78e39dcac03f61cb9c304a1e')

build() {
  cd $srcdir/$pkgname-$pkgver
  make
}
package() {
  cd $srcdir/$pkgname-$pkgver
  mkdir -p $pkgdir/usr/{bin,share/man/man1}
  make prefix=$pkgdir/usr install
}

# vim:set ts=2 sw=2 et:
