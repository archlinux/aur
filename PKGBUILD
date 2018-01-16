# Maintainer: Albert Graef <aggraef@gmail.com>
# Contributor: Bjoern Lindig bjoern dot lindig at googlemail dot com

pkgname=pure-faust
pkgver=0.13
pkgrel=1
pkgdesc="Run Faust-generated signal processing modules in Pure"
arch=("i686" "x86_64")
license=('LGPL3')
url="http://purelang.bitbucket.org/"
depends=('pure')
makedepends=('faust')
groups=(pure-complete pure-multimedia)
source=("https://github.com/agraef/pure-lang/releases/download/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('5d020b28b7ea81ddbc9f2b2a7f53f8dc')

build() {
  cd $srcdir/$pkgname-$pkgver
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}
