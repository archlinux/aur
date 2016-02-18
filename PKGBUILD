# Maintainer: GI_Jack <iamjacksemail@hackermail.com>

_plugin_name=foxyproxy
_plugin_version=4.5.6
_plugin_id=2464
pkgdesc="FoxyProxy is an advanced proxy management tool that completely replaces Firefox's limited proxying capabilities."
license=('GPL')

pkgname=firefox-extension-$_plugin_name
pkgver=$_plugin_version
pkgrel=2
arch=('any')
url="https://addons.mozilla.org/firefox/addon/$_plugin_id"
depends=("firefox")
source=("https://addons.cdn.mozilla.net/user-media/addons/2464/foxyproxy_standard-${pkgver}-fx+sm+tb.xpi")
sha256sums=('9a9309c1cc3508b145937cccc1048668bb292fb8c1ca5c5ceb73f4405a232a24')

package() {
  cd "$srcdir"
  local emid=$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' install.rdf)
  local dstdir="$pkgdir/usr/lib/firefox/browser/extensions/$emid"
  find . -type f -exec install -Dm644 '{}' "$dstdir/{}" \;
}

