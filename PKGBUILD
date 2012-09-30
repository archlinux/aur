# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=libgdata
pkgver=0.13.2
pkgrel=1
pkgdesc="GLib-based library for accessing online service APIs using the GData protocol"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libsoup-gnome' 'liboauth' 'gcr' 'gnome-online-accounts')
makedepends=('intltool' 'gobject-introspection')
url="http://www.gnome.org"
options=('!libtool')
source=(http://ftp.gnome.org/pub/gnome/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('3dc4e3529b4bf13d4ae4ef7cc4d74c3b5c90bd96e7d9fa83db2066a2b9a36330')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr --disable-static
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
