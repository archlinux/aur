# Maintainer: Dominik Opyd <d.opyd@oad.earth>

pkgname=forge-server-mcw-paths
modname=mcw-paths
srvname=forge
pkgver=1.0.0
minver=1.19
pkgrel=1

url='https://www.curseforge.com/minecraft/mc-mods/macaws-paths-and-pavings'
arch=('any')
license=('custom')
pkgdesc="This Macaw's mod is another addition to the Macaw's Mod series, the first version adds wooden paths (all wooden variations) and 6 pavings (with 9 texture variations) making a total of 62 paths/pavings."

source=(LICENSE
        https://mediafiles.forgecdn.net/files/3825/282/mcw-paths-1.0.0-mc1.19.jar)
depends=("forge-hooks>=1.0.0"
         "forge-server>=41.0.94")
noextract=($modname-$pkgver-mc$minver.jar)
sha256sums=('9610fdb452d3d92e7e51243963ea189f7783c1a7cdd4238de4d2a32c50042a8d'
            '8228ed1211cda43c908788bad042192a172e2210af05be2c6bb043923214f049')

package() {
  install -Dm 2755 $srcdir/$modname-$pkgver-mc$minver.jar $pkgdir/srv/$srvname/mods/$modname.jar

  install -Dm 644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
