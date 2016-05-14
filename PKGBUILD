# Maintainer: ianux <ianux@free.fr>

pkgname=gnome-video-arcade
pkgver=0.8.6
pkgrel=1
pkgdesc="Simple GTK3 MAME front-end wich supports both XMAME and SDLMAME."
arch=('i686' 'x86_64')
url="https://wiki.gnome.org/action/show/Apps/GnomeVideoArcade"
license=('GPL')
depends=('dconf' 'dbus' 'gtk3' 'libsoup' 'libwnck3' 'hicolor-icon-theme' 'sdlmame' 'sqlite3')
makedepends=('intltool' 'itstool' 'pkgconfig' 'gnome-doc-utils')
source=(http://download.gnome.org/sources/${pkgname}/$(echo ${pkgver} | cut -d. -f1,2)/${pkgname}-${pkgver}.tar.xz)
sha256sums=('2de77ecc9566ee7d76df5deefb191c1cc01452ab7d3b22e92d6dc3f971ddc98e')
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
