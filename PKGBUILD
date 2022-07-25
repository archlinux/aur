# Maintainer: Dominik Opyd <d.opyd@oad.earth>

pkgname=forge-server-mcw-windows
modname=mcw-windows
srvname=forge
pkgver=2.0.3
minver=1.19
pkgrel=1

url='https://www.curseforge.com/minecraft/mc-mods/macaws-windows'
arch=('any')
license=('custom')
pkgdesc="This Minecraft Window mod is all about windows, it adds lots of windows, which can be stacked up to be as tall as you want."

source=(LICENSE
        https://mediafiles.forgecdn.net/files/3830/460/mcw-windows-2.0.3-mc1.19.jar)
depends=("forge-hooks>=1.0.0"
         "forge-server>=41.0.94")
noextract=($modname-$pkgver-mc$minver.jar)
sha256sums=('9610fdb452d3d92e7e51243963ea189f7783c1a7cdd4238de4d2a32c50042a8d'
            '59c0493750127a8ba56e419e418b255794ff7a0461a2e47ec48f87b72d23053b')

package() {
  install -Dm 2755 $srcdir/$modname-$pkgver-mc$minver.jar $pkgdir/srv/$srvname/mods/$modname.jar

  install -Dm 644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
