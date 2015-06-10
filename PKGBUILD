# Maintainer: ianux <ianux@free.fr>

pkgname=gnome-video-arcade
pkgver=0.8.3
pkgrel=1
pkgdesc="Simple GTK3 MAME front-end wich supports both XMAME and SDLMAME."
arch=('i686' 'x86_64')
url="http://live.gnome.org/GnomeVideoArcade"
license=('GPL')
depends=('dconf' 'dbus' 'gtk3' 'libwnck3' 'gstreamer0.10-base-plugins' 'hicolor-icon-theme' 'sdlmame' 'sqlite3')
makedepends=('intltool' 'pkgconfig' 'gnome-doc-utils')
source=(http://ftp.gnome.org/pub/GNOME/sources/${pkgname}/${pkgver%.*}/${pkgname}-${pkgver}.tar.xz)
sha1sums=('d2e658f8e409d30229c79e905d2168eecd1a1bb6')
install=${pkgname}.install

build() {
  cd ${srcdir}/${pkgname}-${pkgver}

  ./configure --prefix=/usr --disable-scrollkeeper
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
}
