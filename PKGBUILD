# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=libcroco
pkgver=0.6.8
pkgrel=2
pkgdesc="A CSS parsing library"
arch=('x86_64' 'i686')
depends=('glib2' 'libxml2')
makedepends=('intltool')
license=('LGPL')
source=(http://ftp.gnome.org/pub/gnome/sources/$pkgname/0.6/$pkgname-$pkgver.tar.xz)
url="http://www.gnome.org"
sha256sums=('ea6e1b858c55219cefd7109756bff5bc1a774ba7a55f7d3ccd734d6b871b8570')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --disable-static
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
