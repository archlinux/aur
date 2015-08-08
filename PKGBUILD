# Maintainer: Tavian Barnes <tavianator@tavianator.com>
# Contributor: ngukho <ngukho at gmail dot com>
pkgname=crfsuite
pkgver=0.12
pkgrel=1
pkgdesc="An implementation of Conditional Random Fields (CRFs) for labeling sequential data."
arch=('i686' 'x86_64')
url="http://www.chokkan.org/software/crfsuite/"
license=('custom:BSD')
depends=('liblbfgs')
source=("https://github.com/downloads/chokkan/crfsuite/$pkgname-$pkgver.tar.gz")
md5sums=('3fb2033066996921e7979e35ab1a570f')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install

  install -D -m644 COPYING $pkgdir/usr/share/licenses/crfsuite/COPYING
}

# vim:set ts=2 sw=2 et:
