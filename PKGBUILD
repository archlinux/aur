# Maintainer: Lubosz Sarnecki <lubosz@gmail.com>

pkgname=jmars
pkgver=5.3.13
pkgrel=0
pkgdesc="'Java Mission-planning and Analysis for Remote Sensing' is a geospatial information system for Mars"
arch=('i686' 'x86_64')
url="https://jmars.mars.asu.edu/"
license=('GPL')
depends=('java-runtime-common' 'desktop-file-utils')
source=("http://jmars.mars.asu.edu/downloads/jmars_5/jmars_public/jmars_5_public.sh" "jmars.desktop")
install=jmars.install
sha256sums=('cd01542542265b07f97f3024d2d5a63152bbd959ea232c1d7262eb6bfb351c95' 'SKIP')

package() { 
  chmod +x jmars_5_public.sh
  ./jmars_5_public.sh -q -dir "$pkgdir/usr/share/jmars/"
  chmod +x "$pkgdir/usr/share/jmars/jmars"
  mkdir -p "$pkgdir/usr/share/applications/"
  install -Dm644 jmars.desktop "$pkgdir/usr/share/applications/"
}
