# Maintainer: Caleb Maclennan <caleb@alerque.com>
#
# Contributor: unlucu <unlucu at gmail dot com>

pkgname=aspell-tr
pkgver=0.50
_rel=0
pkgrel=3
pkgdesc="Turkish dictionary for aspell"
arch=('any')
url="http://turkce.sourceforge.net/"
license=('GPL')
depends=('aspell')
source=("ftp://ftp.gnu.org/gnu/aspell/dict/tr/$pkgname-$pkgver-$_rel.tar.bz2")
sha256sums=('0bc6530e5eebf8b2b53f1e8add596c62099173f62b9baa6b3efaa86752bdfb4a')

build () {
  cd "$pkgname-$pkgver-$_rel"
  ./configure
  make DESTDIR="$pkgdir"/
}

package () {
  cd "$pkgname-$pkgver-$_rel"
  make DESTDIR="$pkgdir"/ install
}
