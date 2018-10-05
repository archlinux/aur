# Maintainer: alastair pharo  asppsa at gmail dot com 
# Contributor: bjoern lindig bjoern dot lindig at googlemail dot com

pkgname=pd-pure
pkgver=0.26
pkgrel=1
pkgdesc="Loader plugin for the Pure programming language which lets you write external Pd objects in Pure"
arch=('i686' 'x86_64')
url="http://purelang.bitbucket.org/"
depends=('pd' 'pure')
license=('BSD')
groups=(pure-complete pure-multimedia)
source=(https://github.com/agraef/pure-lang/releases/download/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('1e50a577f2c61345e9031d2fca5a5449')

build() {
  cd $srcdir/$pkgname-$pkgver
  make prefix=/usr
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir prefix=/usr install
}
