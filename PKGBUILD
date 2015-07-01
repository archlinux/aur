# Maintainer: Your Name <youremail@domain.com>
pkgname=newick-utils
pkgver=1.5.0
pkgrel=1
pkgdesc="The Newick Utilities are a suite of Unix shell tools for processing phylogenetic trees. Functions include re-rooting, extracting subtrees, trimming, pruning, condensing, drawing (ASCII graphics or SVG)."
arch=('any')
url="http://cegg.unige.ch/newick_utils"
license=('BSD')
groups=()
depends=('libxml2' )
makedepends=('automake' 'autoconf')
optdepends=('guile')
source=(http://cegg.unige.ch/pub/$pkgname-$pkgver.tar.gz)
md5sums=('5f65b0fe30bf9389297616358f01fac7')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make install DESTDIR=$pkgdir 
}
