# Maintainer: Vladimir Panteleev <arch-pkg at thecybershadow.net>
# Contributor: anonymous <https://gist.github.com/anonymous/2924244>
pkgname=swfmill
pkgver=0.3.3
pkgrel=1
pkgdesc="xml2swf and swf2xml processor with import functionalities"
arch=('i686' 'x86_64')
url="http://swfmill.org"
license=('GPL')
depends=('libxslt' 'freetype2' 'libpng')
source=(http://swfmill.org/releases/$pkgname-$pkgver.tar.gz
	   $pkgname-$pkgver.patch)
md5sums=('e0fc3c4068ffe135f201e6ee864dce62'
         '34b8022050b2317628a6ade9c21273d7')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
