# Maintainer: Dominik Opyd <d.opyd@oad.earth>

pkgname=forge-server-waystones
modname=waystones
srvname=forge
pkgver=11.1.0
minver=1.19
pkgrel=2

url='https://www.curseforge.com/minecraft/mc-mods/waystones'
arch=('any')
license=('custom')
pkgdesc="This mod adds waystone blocks that the player can return to once they've been activated, either through a Warp Scroll, a rechargeable Warp Stone, or by using an existing waystone to hop from one to the other."

source=(LICENSE
        https://mediafiles.forgecdn.net/files/3901/921/waystones-forge-1.19-11.1.0.jar)
depends=("forge-server"
         "forge-server-balm"
         "forge-server-hooks")
noextract=($modname-$srvname-$minver-$pkgver.jar)
sha256sums=('9610fdb452d3d92e7e51243963ea189f7783c1a7cdd4238de4d2a32c50042a8d'
            '7127d14c4df967afad2a3207aa5434db98cdd2bc7f96d61791fd597f96b53d9c')

package() {
  install -Dm 2755 $srcdir/$modname-$srvname-$minver-$pkgver.jar $pkgdir/srv/$srvname/mods/$modname.jar

  install -Dm 644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
