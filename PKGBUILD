# Maintainer: Dominik Opyd <d.opyd@oad.earth>

pkgname=aoa
pkgver=3.6.10
minver=1.19
pkgrel=1
pkgdesc="Advent of Ascension is a massive adventure and exploration mod designed with the purpose of fleshing out every area of the game as much as possible."
arch=('any')
url='https://www.curseforge.com/minecraft/mc-mods/advent-of-ascension-nevermine'
source=(https://github.com/Tslat/Advent-Of-Ascension/blob/$minver/LICENSE.md
        https://mediafiles.forgecdn.net/files/3894/434/AoA3-1.19-3.6.10.jar)
license=('other')
depends=("geckolib>=3.1.8" 
         "forge-hooks>=1.0.0"
         "forge-server>=41.0.98")
provides=(aoa=$pkgver)
noextract=(AoA3--$minver-$pkver.jar)
sha256sums=('6300552af54c44b4079ac6dc19ad1eee402429994b9d2026441d14e0a5a073e5'
            '3599809d71a4ad144fca2dce6f523ae1bbd8fd908505379f49c3ffd83df08a6a')
groups=(forge-mods minecraft-mods)

package() {
  local srvpath=/srv/forge

  install -Dm 2755 $srcdir/AoA3-1.19-3.6.10.jar $pkgdir$srvpath/mods/$pkgname.jar

  install -Dm 644 $srcdir/LICENSE.md ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
