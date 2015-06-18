# Maintainer: David Adler <david dot jo dot adler at gmail dot com>
pkgname=jack_snapshot
pkgver=0.0.4
pkgrel=2
pkgdesc="stores and restores a set of JACK connections"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/heaven/files/Audio%20Applications/Jack%20Related/jack_snapshot/"
license=('GPL')
depends=('jack')
source=(http://downloads.sourceforge.net/project/heaven/Audio%20Applications/Jack%20Related/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('253fb004146e9405c5fd85f66e1bfc0d')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -m755 -d "$pkgdir/usr/bin"
  make PREFIX="$pkgdir/usr" install
}

# vim:set ts=2 sw=2 et:
