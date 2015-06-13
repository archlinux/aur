# Maintainer: Alastair Pharo  asppsa at gmail dot com

pkgname=pure-pandoc
pkgver=0.1
pkgrel=1
pkgdesc="Converts Sphinx-formatted Pure documentation files to Markdown and other formats using Pandoc"
arch=("any")
license=('GPL')
url="http://purelang.bitbucket.org/"
depends=('haskell-pandoc>=1.12.3' 'gawk')
makedepends=()
groups=(pure-complete)

source=("https://bitbucket.org/purelang/pure-lang/downloads/$pkgname-$pkgver.tar.gz")
sha1sums=('2d46db3b23eb75ed9e3dc25abce64b911a6b12f7')

build() {
  cd $srcdir/$pkgname-$pkgver
  make prefix=/usr || return 1
}

package() {
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/share/man/man1
  cd $srcdir/$pkgname-$pkgver
  make prefix=/usr DESTDIR=$pkgdir install || return 1
}
