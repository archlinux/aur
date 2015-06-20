# Maintainer: josephgbr <rafael.f.f1@gmail.com>

pkgname=teeworlds-ddnet-skins
pkgver=1
pkgrel=1
pkgdesc="Skin database stored in DDraceNetwork website"
arch=(any)
url="http://ddnet.tw/skins/"
license=('GPL')
makedepends=('unzip')
source=("http://ddnet.tw/skins/zip/database.zip")
md5sums=('6efaa60bc7c432f2e92bc9a248c04726')

package() {
  install -dm755 "$pkgdir"/usr/share/teeworlds/data/skins/	
  cp "$srcdir"/database.dir/*.png "$pkgdir"/usr/share/teeworlds/data/skins/
  
    # Remove skins available in ALL teeworlds client (default and mods)
  for skin in "bluekitty.png" "bluestripe.png" "brownbear.png" "cammo.png" \
              "cammostripes.png" "coala.png" "default.png" "limekitty.png" \
              "pinky.png" "redbopp.png" "redstripe.png" "saddo.png"        \
              "toptri.png" "twinbop.png" "twintri.png" "warpaint.png"      \
              "x_ninja.png" 
  do
        rm "$pkgdir"/usr/share/teeworlds/data/skins/$skin
  done
}
