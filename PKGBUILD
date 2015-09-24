# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=libgdata
pkgver=0.17.3
pkgrel=1
pkgdesc="GLib-based library for accessing online service APIs using the GData protocol"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libsoup' 'liboauth' 'gcr' 'gnome-online-accounts')
makedepends=('intltool' 'gobject-introspection' 'vala' 'uhttpmock')
url="http://www.gnome.org"
source=(http://ftp.gnome.org/pub/gnome/sources/$pkgname/${pkgver:0:4}/$pkgname-$pkgver.tar.xz)
sha256sums=('ff280b031c50a99ed735c3fa18fbea9ae3e4cc5e3d7dd58ebae09994b01b513b')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr --disable-static --disable-tests
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
