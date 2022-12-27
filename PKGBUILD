# Maintainer: Peter Lamby <peterlamby@web.de>
pkgname=deadbeef-mpris2-plugin
pkgver=1.16
pkgrel=1
pkgdesc="MPRISv2 plugin for the DeaDBeeF music player"
arch=('i686' 'x86_64')
url="https://github.com/DeaDBeeF-Player/deadbeef-mpris2-plugin"
license=('GPL2')
depends=('glib2' 'deadbeef' )
conflicts=('deadbeef-mpris-plugin')
options=('!libtool')
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz)
md5sums=('c7943dcb8e723d01edb621b74a37ba14')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  autoreconf --install
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
}
