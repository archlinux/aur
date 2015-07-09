# $Id$
# Maintainer: François Magimel <magimel.francois@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=gnome-mines-3.12.2
_pkgname=gnome-mines
pkgver=3.12.2
pkgrel=1
pkgdesc="Clear hidden mines from a minefield, with colors"
arch=('i686' 'x86_64')
license=('GPL')
depends=('hicolor-icon-theme' 'gtk3' 'librsvg')
makedepends=('intltool' 'itstool' 'gobject-introspection')
conflicts=('gnome-games')
replaces=('gnome-games')
options=('!emptydirs')
install=gnome-mines-3.12.2.install
url="https://wiki.gnome.org/Apps/Mines"
groups=('gnome-extra')
source=(http://ftp.gnome.org/pub/gnome/sources/${_pkgname}/${pkgver:0:4}/${_pkgname}-${pkgver}.tar.xz)
sha256sums=('241d7154be2a14b75a1946279bbe2729e984c59c209aa81a044b2d1b0092143b')

build() {
  cd ${_pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
      --disable-schemas-compile
  make
}

package() {
  cd ${_pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
