# Maintainer: Lubosz Sarnecki <lubosz@gmail.com>

pkgname=jmars
pkgver=3.0.4
pkgrel=1
pkgdesc="'Java Mission-planning and Analysis for Remote Sensing' is a geospatial information system for Mars"
arch=('i686' 'x86_64')
url="http://jmars.asu.edu/"
license=('GPL')
depends=('java-runtime' 'desktop-file-utils')
source=("http://jmars.asu.edu/downloads/version3/jmars/JMARS_linux_64.sh" "jmars.desktop")
install=jmars.install
sha256sums=('9417fa8f43e102de7f88fb32b88397a98ea216e0527a58094f1d5931b04de4ac' 'SKIP')

package() { 
  chmod +x JMARS_linux_64.sh
  ./JMARS_linux_64.sh -q -dir "$pkgdir/usr/share/jmars/"
  chmod +x "$pkgdir/usr/share/jmars/jmars"
  mkdir -p "$pkgdir/usr/share/applications/"
  install -Dm644 jmars.desktop "$pkgdir/usr/share/applications/"
}
