# Maintainer: Dominik Opyd <d.opyd@oad.earth>

pkgname=forge-server-mcw-furniture
modname=mcw-furniture
srvname=forge
pkgver=3.0.1
minver=1.19
pkgrel=1

url='https://www.curseforge.com/minecraft/mc-mods/macaws-furniture'
arch=('any')
license=('custom')
pkgdesc="Macaw's Furniture focuses on different styles of furniture and customization."

source=(LICENSE
        https://mediafiles.forgecdn.net/files/3879/905/mcw-furniture-3.0.1-mc1.19.jar)
depends=("forge-hooks>=1.0.0"
         "forge-server>=41.0.94")
noextract=($modname-$pkgver-mc$minver.jar)
sha256sums=('9610fdb452d3d92e7e51243963ea189f7783c1a7cdd4238de4d2a32c50042a8d'
            '3e6a16a78cccdf880a335533962e315743a6b6aa4db18a82dddc99cd8c50eee5')

package() {
  install -Dm 2755 $srcdir/$modname-$pkgver-mc$minver.jar $pkgdir/srv/$srvname/mods/$modname.jar

  install -Dm 644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
