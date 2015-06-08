# Maintainer: Sebastian Lau <lauseb644@gmail.com>
# Contributor: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: Tianjiao Yin <ytj000+aur@gmail.com>

pkgname=firefox-extension-video-downloadhelper
pkgver=5.3.1
pkgrel=1
pkgdesc="A Firefox extension to download/convert videos from hundreds of YouTube-like sites"
arch=('any')
url="https://addons.mozilla.org/firefox/addon/video-downloadhelper"
license=('custom')
depends=('firefox')
source=("https://addons.mozilla.org/firefox/downloads/file/303088/video_downloadhelper-${pkgver}-fx.xpi"
	"LICENSE")
md5sums=('65c2204e20ebc9a1784503380c5142df'
         '937544fbad2e07cfb6509e42db6f98e5')

package() {
  # Variables
  emid=$(grep -Po 'id>\K[^<]*' install.rdf | head -1)
  dstdir="$pkgdir/usr/lib/firefox/browser/extensions/$emid/"

  # Install
  install -dm755 "$dstdir"
  rm *.xpi
  cp -r * "$dstdir/"

  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/firefox-extension-video-downloadhelper/LICENSE"
}
