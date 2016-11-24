# Maintainer: delta48 <dark.magician.48+aur[at]gmail[dot]com>

pkgname=firefox-tabgroups
pkgver=2.1.2
pkgrel=1
pkgdesc="This add-on aims to fully replace Tab Groups in Firefox, providing a similar and hopefully even enhanced experience."
arch=('any')
url="https://addons.mozilla.org/es/firefox/addon/tab-groups-panorama"
license=('GPL2')
depends=("firefox")
source=('https://addons.mozilla.org/firefox/downloads/latest/tab-groups-panorama/addon-671381-latest.xpi')
md5sums=('d8d25d88ffbc34e86bb9bfed18cbd984')

package() {
  cd $srcdir
  emid="$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' install.rdf)"
  dstdir=$pkgdir/usr/lib/firefox/browser/extensions
  install -d $dstdir
  cp *.xpi $dstdir/${emid}.xpi
}
