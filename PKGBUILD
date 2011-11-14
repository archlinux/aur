# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=libcroco
pkgver=0.6.3
pkgrel=1
pkgdesc="A CSS parsing library"
arch=('x86_64' 'i686')
depends=('glib2' 'libxml2')
makedepends=('intltool')
license=('LGPL')
options=('!libtool')
source=(http://ftp.gnome.org/pub/gnome/sources/$pkgname/0.6/$pkgname-$pkgver.tar.xz)
url="http://www.gnome.org"
sha256sums=('8b7c565bf3eae1dff0a09d128fc3726acc1a492a7de23b25dce803a4f93d42c1')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --disable-static
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
