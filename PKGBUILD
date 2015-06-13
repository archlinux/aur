# Maintainer: Alastair Pharo <asppsa at gmail dot com>

pkgname=pure-doc
pkgver=0.7
pkgrel=1
pkgdesc="A simple source documentation and literate programming utility for Pure"
arch=("i686" "x86_64")
license=('GPL3')
url="http://purelang.bitbucket.org/"
depends=('pure')
makedepends=()
groups=(pure-complete pure-util)
source=("https://bitbucket.org/purelang/pure-lang/downloads/$pkgname-$pkgver.tar.gz")
sha1sums=('d4efdc05bf1bd835bc861ac21bff490bc4fba102')

build() {
  cd $srcdir/$pkgname-$pkgver
  make || return 1
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install || return 1
}
