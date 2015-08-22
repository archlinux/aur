# Maintainer: josephgbr <rafael.f.f1@gmail.com>

pkgname=teeworlds-ddnet-skins
pkgver=1
pkgrel=2
pkgdesc="Skin database stored in DDraceNetwork website"
arch=(any)
url="http://ddnet.tw/skins/"
license=('GPL')
makedepends=('unzip')
source=("http://ddnet.tw/skins/zip/database.zip")
md5sums=('6e27589b01b902f99b27b1cd1be54451')

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
