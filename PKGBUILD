# Maintainer: Dominik Opyd <d.opyd@oad.earth>

pkgname=forge-server-mcw-roofs
modname=mcw-roofs
srvname=forge
pkgver=2.1.2
minver=1.19
pkgrel=1

url='https://www.curseforge.com/minecraft/mc-mods/macaws-roofs'
arch=('any')
license=('custom')
pkgdesc="Macaw's Roofs mod includes many types of new stuff : Roofs, Steep Roofs, Lower Roofs, Awnings, Top Roofs, Rain Gutters and a lot more!"

source=(LICENSE
        https://mediafiles.forgecdn.net/files/3830/465/mcw-roofs-2.1.2-mc1.19.jar)
depends=("forge-hooks>=1.0.0"
         "forge-server>=41.0.94")
noextract=($modname-$pkgver-mc$minver.jar)
sha256sums=('9610fdb452d3d92e7e51243963ea189f7783c1a7cdd4238de4d2a32c50042a8d'
            '3951db281f46e5f5fab86ea3033993f3fffdfb21d09b2d8ee1cff395c07e388f')

package() {
  install -Dm 2755 $srcdir/$modname-$pkgver-mc$minver.jar $pkgdir/srv/$srvname/mods/$modname.jar

  install -Dm 644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
