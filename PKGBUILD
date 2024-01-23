# Maintainer: Aseem Athale <athaleaseem@gmail.com>
# Contributor: Tavian Barnes <tavianator@tavianator.com>
# Contributor: ngukho <ngukho at gmail dot com>
pkgname=crfsuite
pkgver=0.12
pkgrel=2
pkgdesc="An implementation of Conditional Random Fields (CRFs) for labeling sequential data."
arch=('i686' 'x86_64')
url="http://www.chokkan.org/software/crfsuite/"
license=('custom:BSD')
depends=('liblbfgs')
source=("https://github.com/mistersmee/crfsuite/archive/refs/tags/$pkgver-1.tar.gz")
md5sums=('4a8ca0f18c768bdb8e65c2bf039ccc8e')

build() {
  cd "$srcdir/$pkgname-$pkgver-1"

  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver-1"

  make DESTDIR="$pkgdir/" install

  install -D -m644 COPYING $pkgdir/usr/share/licenses/crfsuite/COPYING
}

# vim:set ts=2 sw=2 et:
