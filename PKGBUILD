# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=gnome2-icon-theme
_pkgname=gnome-icon-theme
pkgver=2.31.0
pkgrel=1
pkgdesc="GNOME2 icon theme"
arch=('any')
depends=('hicolor-icon-theme' 'gtk-update-icon-cache' 'gnome2-icon-theme-symbolic')
makedepends=('intltool' 'icon-naming-utils')
url="http://www.gnome.org"
license=('GPL')
provides=($_pkgname)
conflicts=($_pkgname)
install=$_pkgname.install
options=('!emptydirs')
source=("http://ftp.gnome.org/pub/gnome/sources/$_pkgname/${pkgver:0:4}/$_pkgname-$pkgver.tar.bz2")
sha256sums=('ea7e05b77ead159379392b3b275ca0c9cbacd7d936014e447cc7c5e27a767982')

build() {
  cd $_pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  rm -f "${pkgdir}/usr/share/icons/gnome/icon-theme.cache"
}
