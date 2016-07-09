# Maintainer: Simon Thorpe <simon@hivetechnology.com.au>
pkgname=firefox-extension-vlc-context-menu
pkgver=0.8.1
pkgrel=2
pkgdesc="Open audio/video links directly in VLC via Firefox context menu"
arch=('any')
url="https://addons.mozilla.org/en-US/firefox/addon/vlc-context-menu/"
license=('GPLv3')
depends=('firefox' 'vlc')
source=('https://addons.mozilla.org/firefox/downloads/latest/12042/addon-12042-latest.xpi')
sha256sums=('0294d601800fa5d32c8143840d4316633c5f7385c696eb405bd7d1e1c3b3dc8a')

package() {
  emid=$(grep -Po 'id>\K[^<]*' install.rdf | head -1)
  local dstdir=$pkgdir/usr/lib/firefox/browser/extensions/$emid/
  install -dm755 "$dstdir"
  rm *.xpi
  cp -r * "$dstdir/"
}
