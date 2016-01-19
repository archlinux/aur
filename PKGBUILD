# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=libgdata
pkgver=0.17.4
pkgrel=1
pkgdesc="GLib-based library for accessing online service APIs using the GData protocol"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libsoup' 'liboauth' 'gcr' 'gnome-online-accounts')
makedepends=('intltool' 'gobject-introspection' 'vala' 'uhttpmock')
url="http://www.gnome.org"
source=(https://download.gnome.org/sources/$pkgname/${pkgver:0:4}/$pkgname-$pkgver.tar.xz)
sha256sums=('9f15fe0efe4d9a001d45853891ab3a7c45cadc4dea2252944b7341903ce1d1f6')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr --disable-static --disable-tests
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
