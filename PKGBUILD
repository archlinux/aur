# Maintainer: Lubosz Sarnecki <lubosz@gmail.com>

pkgname=jmars
pkgver=5.3.14
pkgrel=1
pkgdesc="Java Mission-planning and Analysis for Remote Sensing is a geospatial information system for Mars"
arch=('i686' 'x86_64')
url="https://jmars.mars.asu.edu/"
license=('GPL')
depends=('java-runtime-common' 'desktop-file-utils')
source=("http://jmars.mars.asu.edu/downloads/jmars_5/jmars_public/jmars_5_public.sh" "jmars.desktop")
install=jmars.install
sha256sums=('a78ad4807b5dda59e11d38cf65cd4a49fd27776c39b42c5058a10fce893eccd6'
            '63b95d3840f500530750d7bbdf6f23f4c97b76857f93957992972a2b71a12fd1')

package() { 
  chmod +x jmars_5_public.sh
  ./jmars_5_public.sh -q -dir "$pkgdir/usr/share/jmars/"
  chmod +x "$pkgdir/usr/share/jmars/jmars"
  mkdir -p "$pkgdir/usr/share/applications/"
  install -Dm644 jmars.desktop "$pkgdir/usr/share/applications/"
}
