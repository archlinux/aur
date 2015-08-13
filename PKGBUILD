# Maintainer: Andrey Vihrov <andrey.vihrov at gmail.com>

pkgname=xfdashboard
pkgver=0.4.2
pkgrel=1
pkgdesc="Maybe a Gnome shell like dashboard for Xfce"
arch=('i686' 'x86_64')
url="http://goodies.xfce.org/projects/applications/xfdashboard/start"
license=('GPL')
depends=('libwnck3' 'clutter' 'glib2' 'xfconf' 'dbus-glib' 'garcon' 'gtk3'
         'libxfce4util' 'libxcomposite' 'libxdamage' 'libxinerama' 'xdg-utils')
makedepends=('intltool')
install="xfdashboard.install"
source=("http://archive.xfce.org/src/apps/${pkgname}/0.4/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('d00f8378b5813f307a54d97150cad1ba9f5fc2c4e175e127b787610d603cec3a')

build() {
  cd "${pkgname}-${pkgver}"

  ./configure --prefix=/usr --sysconfdir=/etc --disable-dependency-tracking
  make
}

package() {
  cd "${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
