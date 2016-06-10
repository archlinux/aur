# Maintainer: delta48 <dark.magician.48+aur[at]gmail[dot]com>
# based on firefox-noscript PKGBUILD

pkgname=firefox-flashgot
pkgver=1.5.6.13
pkgrel=1
pkgdesc="Extension for firefox which download video"
arch=('any')
url="http://flashgot.net"
license=('GPL2')
depends=("firefox")
source=(https://addons.mozilla.org/firefox/downloads/latest/220/addon-220-latest.xpi)
md5sums=('07a1ca18fb67b3b7e8b5db01de8e3b7f')

package() {
  cd $srcdir
  emid="$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' install.rdf)"
  dstdir=$pkgdir/usr/lib/firefox/browser/extensions
  install -d $dstdir
  cp *.xpi $dstdir/${emid}.xpi
}
