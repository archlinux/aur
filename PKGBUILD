# Maintainer: GI_Jack <iamjacksemail@hackermail.com>

_plugin_name=foxyproxy
_plugin_version=4.5.5
_plugin_id=2464
pkgdesc="FoxyProxy is an advanced proxy management tool that completely replaces Firefox's limited proxying capabilities."
license=('GPL')

pkgname=firefox-extension-$_plugin_name
pkgver=$_plugin_version
pkgrel=1
arch=('any')
url="https://addons.mozilla.org/firefox/addon/$_plugin_id"
depends=("firefox")
source=("https://addons.cdn.mozilla.net/user-media/addons/2464/foxyproxy_standard-${pkgver}-sm+tb+fx.xpi")

package() {
  cd $srcdir
  emid=$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' install.rdf) || return 1
  local dstdir=$pkgdir/usr/lib/firefox/browser/extensions/${emid}
  install -d $dstdir
  #sed -i 's#<em:maxVersion>.*</em:maxVersion>#<em:maxVersion>11.*</em:maxVersion>#' install.rdf
  rm *.xpi
  mv * $dstdir
}
sha256sums=('56dc7075233db41e4d50304762e8f7518b8ebd6c65eeefc9cb72699e290bf749')


