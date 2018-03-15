# Maintainer: Eragon <sam.vzh@gmail.com>
pkgname=libtranslate
pkgver=0.99
pkgrel=2
pkgdesc="library for translating text and web pages between natural languages"
arch=('any')
url='http://www.nongnu.org/libtranslate/'
license=('GPL')
depends=('glib' 'libsoup' 'libxml2')
makedepends=('make', 'cpp')
source=(http://savannah.nongnu.org/download/libtranslate/$pkgname-$pkgver.tar.gz)
md5sums=('1fe75a6a6e8a0c6518890b5fa6984d42')

build() {
  [ -f /etc/profile.d/gnome.sh ] && . /etc/profile.d/gnome.sh
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}
