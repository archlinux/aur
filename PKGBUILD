# Contributor: Tianjiao Yin <ytj000+aur@gmail.com>
# Maintainer: Arthur Zamarin <arthurzam@gmail.com>

_plugin_name=fastestfox
_plugin_version=5.2.1
_plugin_id=9825
pkgdesc="Save time by speeding up repetitive tasks."
license=('MPL')

pkgname=firefox-extension-$_plugin_name
pkgver=$_plugin_version
pkgrel=1
arch=('any')
url="https://addons.mozilla.org/firefox/addon/$_plugin_id"
depends=("firefox")
source=("https://addons.mozilla.org/firefox/downloads/file/197174/fastestfox_browse_faster-5.2.1-fx.xpi")
md5sums=('74d509053e6fafeb3617732ab107dceb')

build() {
  cd $srcdir
  emid=$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' install.rdf) || return 1
  local dstdir=$pkgdir/usr/lib/firefox/extensions/${emid}
  install -d $dstdir
  rm *.xpi
  mv * $dstdir
}
