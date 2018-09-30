# Maintainer:  Rod Kay     <charlie5 on #ada at freenode.net>
# Contributor: Julian Leyh <julian@vgai.de>

pkgname=ahven
pkgver=2.7
pkgrel=1
pkgdesc="A simple unit test framework for the Ada programming language."

arch=('i686' 'x86_64')
url="http://ahven-framework.com/"
license=('ISC')

depends=('gcc-ada')
makedepends=('sphinxcontrib-adadomain')

source=(http://www.ahven-framework.com/releases/ahven-2.7.tar.gz)
sha256sums=('c198a5cd33244ef4741cc762ef4a51f13a1eaa4c5a77030ed898625ee1e060a1')


build() 
{
  cd "$srcdir/$pkgname-$pkgver"
  make prefix=/usr
  make prefix=/usr docs
}


check() 
{
  cd "$srcdir/$pkgname-$pkgver"
  make check
}


package() 
{
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR=$pkgdir install
}
