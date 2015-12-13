# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=libcroco
pkgver=0.6.10
pkgrel=1
pkgdesc="A CSS parsing library"
arch=('x86_64' 'i686')
depends=('glib2' 'libxml2')
makedepends=('intltool')
license=('LGPL')
source=(http://ftp.gnome.org/pub/gnome/sources/$pkgname/0.6/$pkgname-$pkgver.tar.xz)
url="http://www.gnome.org"
sha256sums=('72066611df77f5c4fb28268cfc7306ecc1517212a6182c2ea756c326a154246c')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --disable-static
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
