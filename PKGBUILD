# Maintainer: Vladimir Panteleev <arch-pkg at thecybershadow.net>
# Contributor: anonymous <https://gist.github.com/anonymous/2924244>
pkgname=swfmill
pkgver=0.3.6
pkgrel=1
pkgdesc="xml2swf and swf2xml processor with import functionalities"
arch=('i686' 'x86_64')
url="http://swfmill.org"
license=('GPL')
depends=('libxslt' 'freetype2' 'libpng')
source=(http://swfmill.org/releases/$pkgname-$pkgver.tar.gz)
md5sums=('3976c33a69a7f08876a7b8ee5f0ba83d')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
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
