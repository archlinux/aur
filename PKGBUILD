# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: Andreas B. Wagner <AndreasBWagner@pointfree.net>
pkgname=maptiler64bit
pkgver=7.2
pkgrel=1
pkgdesc="Map Tile Cutter - Tile Overlay Generator for Google Maps and Google Earth"
arch=('x86_64')
url="http://www.maptiler.org/"
license=('BSD')
depends=('gdal')
makedepends=('dpkg')
source=("http://downloads.klokantech.com/maptiler/${pkgname%64bit}-${pkgver}-free-linux.ubuntu-yakkety.amd64.deb"
        "maptilergui.sh")
md5sums=('4ba2b649a5fcb7c5714ca11dd56c1177'
         '1d909472d36eb0366a8971196b56f12d')

package() {
  dpkg -x ${pkgname%64bit}-${pkgver}-free-linux.ubuntu-yakkety.amd64.deb "$pkgdir"
  mkdir -p ${pkgdir}/usr/{share/maptiler/libs,bin}
  rm ${pkgdir}/usr/bin/maptilergui
  ln -s /usr/lib/libwebpmux.so.2 ${pkgdir}/usr/share/maptiler/libs/libwebpmux.so.1
  ln -s /usr/lib/libwebp.so.6 ${pkgdir}/usr/share/maptiler/libs/libwebp.so.5
  ln -s /usr/share/maptiler/maptilergui.sh ${pkgdir}/usr/bin/maptilergui
  install -Dm755 ${srcdir}/maptilergui.sh ${pkgdir}/usr/share/maptiler/maptilergui.sh
}

# vim:set ts=2 sw=2 et:
