# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=libgnomeprintui
pkgver=2.18.6
pkgrel=5
pkgdesc='User interface library for printing with GNOME'
arch=('x86_64' 'i686')
license=('GPL' 'LGPL')
depends=('libgnomeprint>=2.18.8' 'libgnomecanvas>=2.30.2' 'gnome-icon-theme')
makedepends=('intltool')
options=('!libtool')
url='http://www.gnome.org/'
source=("http://ftp.gnome.org/pub/gnome/sources/$pkgname/2.18/$pkgname-$pkgver.tar.bz2")
sha256sums=('156ae5b66e5dcc546efa2449048f792d76c55b30d93a9b67b0c69665e346f46a')

build() {
  cd "$pkgname-$pkgver"

  ./configure --prefix=/usr --disable-static
  make
}

package() {
  make -C "$pkgname-$pkgver" DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
