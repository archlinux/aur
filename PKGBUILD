# Maintainer: alastair pharo  asppsa at gmail dot com 
# Contributor: bjoern lindig bjoern dot lindig at googlemail dot com

pkgname=pd-pure
pkgver=0.21
pkgrel=1
pkgdesc="Loader plugin for the Pure programming language which lets you write external Pd objects in Pure"
arch=('i686' 'x86_64')
url="http://purelang.bitbucket.org/"
depends=('pd' 'pure')
license=('BSD')
groups=(pure-complete pure-multimedia)
source=(https://bitbucket.org/purelang/pure-lang/downloads/$pkgname-$pkgver.tar.gz)
md5sums=('c295d7d33a8c03f4ed410c14f829bbd5')

build() {
  cd $srcdir/$pkgname-$pkgver
  make prefix=/usr
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir prefix=/usr install
}
