# Maintainer: Vain <aurmaint1 on host: uninformativ dot de>

_plugin_name=overbite
_plugin_version=3.0.1627.1
_plugin_id=7685
pkgdesc="Gopher plugin for Firefox"
license=('MPL')

pkgname=firefox-extension-$_plugin_name
pkgver=$_plugin_version
pkgrel=1
arch=('any')
url="https://addons.mozilla.org/firefox/addon/$_plugin_id"
depends=('firefox')
source=("https://addons.mozilla.org/firefox/downloads/latest/$_plugin_id/addon-$_plugin_id-latest.xpi")
md5sums=('f791955b53d83610507027d4de7c09df')

package() {
  cd "$srcdir"
  emid=$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' install.rdf)
  dstdir=$pkgdir/usr/lib/firefox/browser/extensions/$emid
  install -d "$dstdir"
  mv * "$dstdir"
  rm "$dstdir"/*.xpi
}
