# Maintainer: ianux <ianux@free.fr>

pkgname=gnome-video-arcade
pkgver=0.8.5
pkgrel=1
pkgdesc="Simple GTK3 MAME front-end wich supports both XMAME and SDLMAME."
arch=('i686' 'x86_64')
url="http://live.gnome.org/GnomeVideoArcade"
license=('GPL')
depends=('dconf' 'dbus' 'gtk3' 'libsoup' 'libwnck3' 'hicolor-icon-theme' 'sdlmame' 'sqlite3')
makedepends=('intltool' 'itstool' 'pkgconfig' 'gnome-doc-utils')
source=(http://ftp.gnome.org/pub/GNOME/sources/${pkgname}/$(echo ${pkgver} | cut -d. -f1,2)/${pkgname}-${pkgver}.tar.xz)
sha256sums=('1fec19df25139e01c2cc0ab3c037387bf85238c8b5e15987199b76172cdcc308')
install=${pkgname}.install

build() {
  cd ${srcdir}/${pkgname}-${pkgver}

  ./configure --prefix=/usr
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
}
