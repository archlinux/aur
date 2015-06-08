# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Baurzhan Muftakhidinov <baurthefirst at gmail dot com>

pkgname=libnotifymm
pkgver=0.7.0
pkgrel=1
pkgdesc="C++ wrappers for libnotify"
arch=('i686' 'x86_64')
license=('LGPL')
depends=('gtkmm3' 'libnotify')
source=(http://ftp.gnome.org/pub/gnome/sources/$pkgname/0.7/$pkgname-$pkgver.tar.xz)
url="http://www.gnome.org/"
sha256sums=('bfe4b4411265d5bf437408735a37b6ad8e4da772eec1e2aa18792745e6a60954')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
