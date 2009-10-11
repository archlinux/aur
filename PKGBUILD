# $Id: $
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=libgdata
pkgver=0.4.0
pkgrel=1
pkgdesc="GLib-based library for accessing online service APIs using the GData protocol"
arch=(i686 x86_64)
license=('GPL')
depends=('libsoup-gnome>=2.27.91')
makedepends=('pkgconfig' 'intltool')
url="http://www.gnome.org"
options=('!libtool')
source=(http://ftp.gnome.org/pub/gnome/sources/${pkgname}/0.4/${pkgname}-${pkgver}.tar.bz2)
sha256sums=('55c616b0761faaa9fb028434de97b02d5145dfc52b1db632671ebc6cc6905575')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --disable-static || return 1
  make || return 1
  make DESTDIR="${pkgdir}" install || return 1
}
