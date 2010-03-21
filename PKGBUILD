# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=libgdata
pkgver=0.6.3
pkgrel=1
pkgdesc="GLib-based library for accessing online service APIs using the GData protocol"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libsoup-gnome>=2.29.91')
makedepends=('pkgconfig' 'intltool' 'gir-repository')
url="http://www.gnome.org"
options=('!libtool')
source=(http://ftp.gnome.org/pub/gnome/sources/${pkgname}/0.6/${pkgname}-${pkgver}.tar.bz2)
sha256sums=('35ae732fb2054b2e39e420eff72ad9500b65427728ba8efaa056d54e22bc3523')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --disable-static || return 1
  make || return 1
  make DESTDIR="${pkgdir}" install || return 1
}
