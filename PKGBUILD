# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=gnome2-icon-theme-symbolic
_pkgname=gnome-icon-theme-symbolic
pkgver=2.31.0
pkgrel=1
pkgdesc="GNOME 2 icon theme, symbolic icons"
arch=(any)
depends=(gtk-update-icon-cache hicolor-icon-theme librsvg)
makedepends=(intltool icon-naming-utils)
url="http://www.gnome.org"
license=(GPL)
provides=($_pkgname)
conflicts=($_pkgname)
install=$_pkgname.install
source=(http://ftp.gnome.org/pub/gnome/sources/$_pkgname/${pkgver:0:4}/$_pkgname-$pkgver.tar.bz2)
sha256sums=('5fa028e7263e15ef58ab21963303becd6ecd6321c3e3e570820fa434203191bd')

build() {
  cd "$_pkgname-$pkgver"
  GTK_UPDATE_ICON_CACHE=/bin/true ./configure --prefix=/usr
  make
}

package() {
  cd "$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
