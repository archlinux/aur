# Contributor: Heavysink <winstonwu91@gmail.com>

pkgname=meteoinfo
pkgver=3.4.11
pkgrel=1
pkgdesc="An open source software suite to view and analyze meteorological and spatial data interactively (MeteoInfoMap) or do scientific computation and visualization (MeteoInfoLab)"
arch=("any")
url="http://meteothink.org"
license=("LGPL")
depends=("sh" "java-environment")
makedepends=("unzip")
source=("http://meteothink.org/downloads/files/MeteoInfo_${pkgver}.zip")
sha256sums=('8a4245e5da4f552508e485f50fe3cb98eba4b8d92d0d646152bd3b172dcb04db')
noextract=()

package() {
  mkdir -p $pkgdir/opt
  mkdir -p $pkgdir/usr/bin
  unzip $srcdir/MeteoInfo_${pkgver}.zip -d $pkgdir/opt
  cd $pkgdir/opt/MeteoInfo
  chmod +x milab.sh mimap.sh
  rm *.exe *_mac.sh *.log
  cd $srcdir
  ln -s /opt/MeteoInfo/milab.sh $pkgdir/usr/bin/milab
  ln -s /opt/MeteoInfo/mimap.sh $pkgdir/usr/bin/mimap
}
