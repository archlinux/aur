# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=libcroco
pkgver=0.6.11
pkgrel=1
pkgdesc="A CSS parsing library"
arch=('x86_64' 'i686')
depends=('glib2' 'libxml2')
makedepends=('intltool')
license=('LGPL')
source=(https://download.gnome.org/sources/$pkgname/0.6/$pkgname-$pkgver.tar.xz)
url="http://www.gnome.org"
sha256sums=('132b528a948586b0dfa05d7e9e059901bca5a3be675b6071a90a90b81ae5a056')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --disable-static
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
