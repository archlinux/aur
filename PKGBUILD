# Contributor: Tim Besard <tim.besard@gmail.com>
# Maintainer: Jose Riha <jose 1711 gmail com>
pkgname=osmosis
pkgver=0.43.1
pkgrel=1
pkgdesc="Command line Java application for processing OSM data."
arch=('any')
url="http://wiki.openstreetmap.org/wiki/Osmosis"
license=('GPL')
depends=('java-runtime')
source=(http://bretth.dev.openstreetmap.org/$pkgname-build/$pkgname-$pkgver.tgz) 
md5sums=('e4a4cdecdc464ec669ec71f8439d59c6')

build() {
true
}

package() {
  cd "$srcdir"
  rm osmosis-0.43.1.tgz
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

