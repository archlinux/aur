# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=libcroco
pkgver=0.6.9
pkgrel=1
pkgdesc="A CSS parsing library"
arch=('x86_64' 'i686')
depends=('glib2' 'libxml2')
makedepends=('intltool')
license=('LGPL')
source=(http://ftp.gnome.org/pub/gnome/sources/$pkgname/0.6/$pkgname-$pkgver.tar.xz)
url="http://www.gnome.org"
sha256sums=('38b9a6aed1813e55b3ca07a68d1af845ad4d1f984602e9272fe692930c0be0ae')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --disable-static
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
