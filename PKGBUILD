# Maintainer: delta48 <dark.magician.48[at]gmail[dot]com>
# based on firefox-noscript PKGBUILD

pkgname=firefox-flashgot
pkgver=1.5.6.12
pkgrel=1
pkgdesc="Extension for firefox which download video"
arch=('any')
url="http://flashgot.net"
license=('GPL2')
depends=("firefox")
#makedepends=('unzip')
source=(https://secure.informaction.com/download/releases/flashgot-$pkgver.xpi)
md5sums=('f8262859d8bba81d040a9d9bf1441578')

package() {
  cd $srcdir
  local emid=$(sed -n -e '/<\?em:id>\?/!d; s/.*\([\"{].*[}\"]\).*/\1/; s/\"//g; p; q' install.rdf)
  local dstdir=$pkgdir/usr/lib/firefox/browser/extensions/${emid}
  install -d $dstdir
  cp -R * $dstdir
  rm $dstdir/flashgot-$pkgver.xpi
}
