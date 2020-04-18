# Contributor: Tim Besard <tim.besard@gmail.com>
# Maintainer: Jose Riha <jose 1711 gmail com>
pkgname=osmosis
pkgver=0.47.4
pkgrel=1
pkgdesc="Command line Java application for processing OSM data."
arch=('any')
url="http://wiki.openstreetmap.org/wiki/Osmosis"
license=('GPL')
depends=('java-runtime')
source=(https://github.com/openstreetmap/osmosis/releases/download/${pkgver}/osmosis-${pkgver}.tgz)
md5sums=('ac429506df8c3887f8ca9e3c81b55b3c')

package() {
  cd "$srcdir"
  rm ${pkgname}-${pkgver}.tgz
  mkdir -p $pkgdir/usr/share/$pkgname
  cp -a * $pkgdir/usr/share/$pkgname/  
  chmod +x $pkgdir/usr/share/$pkgname/bin/$pkgname
  
  mkdir -p $pkgdir/usr/bin
  cat >> $pkgdir/usr/bin/$pkgname << EOF 
#!/bin/bash
/usr/share/$pkgname/bin/$pkgname "\$@"
EOF
  chmod a+x $pkgdir/usr/bin/$pkgname
}

