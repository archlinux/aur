# Maintainer: Sebastian Lau <lauseb644@gmail.com>
# Contributor: Tianjiao Yin <ytj000+aur@gmail.com>

pkgname=firefox-extension-downthemall
pkgver=2.0.18
pkgrel=2
pkgdesc="A Download Manager extension for Firefox with advanced capabilities"
arch=('any')
url="http://www.downthemall.net/"
license=('GPL2')
depends=('firefox')
# source=("https://code.downthemall.net/releases/downthemall-$pkgver.xpi")
# md5sums=("$(curl -sL ${source/.xpi/.md5} | cut -d ' ' -f1)")
source=("https://addons.cdn.mozilla.net/user-media/addons/201/downthemall-${pkgver}-sm+fx.xpi")
md5sums=('7d7b014579db7b90e0cd356ef9c18eef')

package() {
  # Variables
  emid=$(grep -Po 'id>\K[^<]*' install.rdf | head -1)
  dstdir="$pkgdir/usr/lib/firefox/browser/extensions/$emid/"

  # Install
  install -d "$dstdir"
  rm *.xpi
  mv * "$dstdir"
}
