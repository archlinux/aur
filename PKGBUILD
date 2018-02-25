# Maintainer: alastair pharo  asppsa at gmail dot com 
# Contributor: bjoern lindig bjoern dot lindig at googlemail dot com

pkgname=pd-pure
pkgver=0.25
pkgrel=1
pkgdesc="Loader plugin for the Pure programming language which lets you write external Pd objects in Pure"
arch=('i686' 'x86_64')
url="http://purelang.bitbucket.org/"
depends=('pd' 'pure')
license=('BSD')
groups=(pure-complete pure-multimedia)
source=(https://github.com/agraef/pure-lang/releases/download/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('a98a6bd74bc5b572ef74012bc9891c3e')

build() {
  cd $srcdir/$pkgname-$pkgver
  make prefix=/usr
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir prefix=/usr install
}
