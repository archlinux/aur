# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=libgdata
pkgver=0.14.1
pkgrel=1
pkgdesc="GLib-based library for accessing online service APIs using the GData protocol"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libsoup' 'liboauth' 'gcr' 'gnome-online-accounts')
makedepends=('intltool' 'gobject-introspection' 'vala')
url="http://www.gnome.org"
source=(http://ftp.gnome.org/pub/gnome/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('68bbb2cb70028d79edfaec17184389275044fd58bf881e36df2663e7e191ff1a')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr --disable-static
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
