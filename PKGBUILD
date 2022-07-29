# Maintainer: Dominik Opyd <d.opyd@oad.earth>

pkgname=forge-server-aoa
modname=aoa
srvname=forge
pkgver=3.6.10
minver=1.19
pkgrel=1

url='https://www.curseforge.com/minecraft/mc-mods/advent-of-ascension-nevermine'
arch=('any')
license=('custom')
pkgdesc="Advent of Ascension is a massive adventure and exploration mod designed with the purpose of fleshing out every area of the game as much as possible."

source=(LICENSE
        https://mediafiles.forgecdn.net/files/3894/434/AoA3-1.19-3.6.10.jar)
depends=("forge-server>=41.0.98"
         "forge-server-hooks>=1.0.0"
         "forge-server-geckolib>=3.1.11")
noextract=(AoA3-$minver-$pkgver.jar)
sha256sums=('9610fdb452d3d92e7e51243963ea189f7783c1a7cdd4238de4d2a32c50042a8d'
            '3599809d71a4ad144fca2dce6f523ae1bbd8fd908505379f49c3ffd83df08a6a')

provides=(aoa forge-server-aoa)
replaces=(aoa)
conflicts=(aoa)

package() {
  install -Dm 2755 $srcdir/AoA3-$minver-$pkgver.jar $pkgdir/srv/$srvname/mods/$modname.jar

  install -Dm 644 $srcdir/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
