# Maintainer: Dominik Opyd <d.opyd@oad.earth>

pkgname=forge-server-mcw-bridges
modname=mcw-bridges
srvname=forge
pkgver=2.0.3
minver=1.19
pkgrel=1

url='https://www.curseforge.com/minecraft/mc-mods/macaws-bridges'
arch=('any')
license=('custom')
pkgdesc="This simple mod adds a variety of bridges. The newest version adds corners, any width and bridge stairs. Bridges can be lighted with torches."

source=(LICENSE
        https://mediafiles.forgecdn.net/files/3827/953/mcw-bridges-2.0.3-mc1.19.jar)
depends=("forge-hooks>=1.0.0"
         "forge-server>=41.0.94")
noextract=($modname-$pkgver-mc$minver.jar)
sha256sums=('9610fdb452d3d92e7e51243963ea189f7783c1a7cdd4238de4d2a32c50042a8d'
            'aeb1815a12d24175a7537a5f8b660a0b86a7000695d69a4a03aef280bd2c00fc')

package() {
  install -Dm 2755 $srcdir/$modname-$pkgver-mc$minver.jar $pkgdir/srv/$srvname/mods/$modname.jar

  install -Dm 644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
