# Maintainer: Dominik Opyd <d.opyd@oad.earth>

pkgname=forge-server-mcw-lights
modname=mcw-lights
srvname=forge
pkgver=1.0.3
minver=1.19
pkgrel=1

url='https://www.curseforge.com/minecraft/mc-mods/macaws-lights-and-lamps'
arch=('any')
license=('custom')
pkgdesc="This very simple mod adds new light sources, in the first release : Tiki Torches, Soul Tiki Torches, Street Lamp Posts, Soul Street Lamp Posts, Ceiling Lights, Lamps, Lava Lamp and Garden Light."

source=(LICENSE
        https://mediafiles.forgecdn.net/files/3828/166/mcw-lights-1.0.3-mc1.19.jar)
depends=("forge-hooks>=1.0.0"
         "forge-server>=41.0.94")
noextract=($modname-$pkgver-mc$minver.jar)
sha256sums=('9610fdb452d3d92e7e51243963ea189f7783c1a7cdd4238de4d2a32c50042a8d'
            '335c5f753e364180c38ccef6e0e4f2994ddac8f6ef45fb143bab952978f24559')

package() {
  install -Dm 2755 $srcdir/$modname-$pkgver-mc$minver.jar $pkgdir/srv/$srvname/mods/$modname.jar

  install -Dm 644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
