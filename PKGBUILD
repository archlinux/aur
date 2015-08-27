# Maintainer: Simon Thorpe <simon@hivetechnology.com.au>
pkgname=firefox-extension-vlc-context-menu
pkgver=0.8.1
pkgrel=1
pkgdesc="Open audio/video links directly in VLC via Firefox context menu"
arch=('any')
url="https://addons.mozilla.org/en-US/firefox/addon/vlc-context-menu/"
license=('GPLv3')
depends=('firefox' 'vlc')
source=('https://addons.mozilla.org/firefox/downloads/latest/12042/addon-12042-latest.xpi')
sha256sums=('63ea2af4dbc83a391c36dfb1f7e57aa171ebd59cdf5b785263909f00cf90d7b3')

package() {
  emid=$(grep -Po 'id>\K[^<]*' install.rdf | head -1)
  local dstdir=$pkgdir/usr/lib/firefox/browser/extensions/$emid/
  install -dm755 "$dstdir"
  rm *.xpi
  cp -r * "$dstdir/"
}
