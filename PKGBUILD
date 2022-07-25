# Maintainer: Dominik Opyd <d.opyd@oad.earth>

pkgname=forge-server-mcw-trapdoors
modname=mcw-trapdoors
srvname=forge
pkgver=1.0.6
minver=1.19
pkgrel=1

url='https://www.curseforge.com/minecraft/mc-mods/macaws-trapdoors'
arch=('any')
license=('custom')
pkgdesc="Macaw's Trapdoor adds vanila trapdoors in every plank variation and it adds some new trapdoors too."

source=(LICENSE
        https://mediafiles.forgecdn.net/files/3851/698/mcw-trapdoors-1.0.6-mc1.19.jar)
depends=("forge-hooks>=1.0.0"
         "forge-server>=41.0.94")
noextract=($modname-$pkgver-mc$minver.jar)
sha256sums=('9610fdb452d3d92e7e51243963ea189f7783c1a7cdd4238de4d2a32c50042a8d'
            '89e98bb4694d1d80f0a6319362da586ea2775648bfb532fb8151d7e7db5be2c1')

package() {
  install -Dm 2755 $srcdir/$modname-$pkgver-mc$minver.jar $pkgdir/srv/$srvname/mods/$modname.jar

  install -Dm 644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
