# Maintainer: GI_Jack <iamjacksemail@hackermail.com>
# Based on PKGBUILD firefox-extension-httpseverywhere

_plugin_name=trackmenot
_plugin_version=0.8.17
pkgdesc="Firefox extension to protect web habits from tracking and profiling"
license=('cc-by-nc-sa')
pkgname=firefox-extension-$_plugin_name
pkgver=$_plugin_version
pkgrel=1
arch=('any')
url="http://cs.nyu.edu/trackmenot/"
depends=("firefox")
source=("http://cs.nyu.edu/trackmenot/xpi/trackmenot-${pkgver}.xpi")
sha256sums=('c31d4279db2fdb83836540fcea8fa9913a69481be02133efcfe72e478e955b3a')

package(){
  cd $srcdir
  emid=$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' install.rdf) || return 1
  local dstdir=$pkgdir/usr/lib/firefox/browser/extensions/${emid}
  install -d $dstdir
  cp -r * $dstdir
  rm $dstdir/trackmenot-${pkgver}.xpi
  chmod -R 755 $dstdir
}
