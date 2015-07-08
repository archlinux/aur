# Maintainer: Bridn Bidulock <bidulock@openss7.org>

pkgname=gnome2-icon-theme-extras
_pkgname=gnome-icon-theme-extras
pkgver=2.30.1
pkgrel=1
pkgdesc="GNOME 2 icon theme, extra icons"
arch=(any)
depends=('gnome2-icon-theme')
makedepends=('intltool' 'icon-naming-utils')
url="http://www.gnome.org"
license=('GPL')
provides=($_pkgname)
conflicts=($_pkgname)
install=$_pkgname.install
source=(http://ftp.gnome.org/pub/gnome/sources/$_pkgname/${pkgver%.*}/$_pkgname-$pkgver.tar.bz2)
sha256sums=('45db58ca52765b40a4a22bc8d70d05564c94697d252b8941bb5be76315f6508b')

build() {
  cd $_pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
