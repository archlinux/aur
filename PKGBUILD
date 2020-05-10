# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: ianux <ianux@free.fr>

pkgname=gnome-video-arcade
pkgver=0.8.8
pkgrel=1
pkgdesc="Simple GTK3 front-end wich supports MAME"
arch=(i686 x86_64)
url="https://wiki.gnome.org/action/show/Apps/GnomeVideoArcade"
license=(GPL)
depends=(dconf dbus gtk3 libsoup libwnck3 hicolor-icon-theme mame sqlite3)
makedepends=(intltool itstool gnome-doc-utils)
source=(http://download.gnome.org/sources/${pkgname}/$(echo ${pkgver} | cut -d. -f1,2)/${pkgname}-${pkgver}.tar.xz)
sha256sums=('91287b62c2cf2bf982d132b5b1a3f3d34f117254faff134af73b0c8e2b56d026')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR=${pkgdir} install
}
