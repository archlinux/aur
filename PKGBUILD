# Maintainer: Dominik Opyd <d.opyd@oad.earth>

pkgname=forge-server-mcw-doors
modname=mcw-doors
srvname=forge
pkgver=1.0.6
minver=1.19
pkgrel=1

url='https://www.curseforge.com/minecraft/mc-mods/macaws-doors'
arch=('any')
license=('custom')
pkgdesc="This mod gives you the opportunity to make vanila doors with every wood color."

source=(LICENSE
        https://mediafiles.forgecdn.net/files/3844/125/mcw-doors-1.0.6-mc1.19.jar)
depends=("forge-hooks>=1.0.0"
         "forge-server>=41.0.94")
noextract=($modname-$pkgver-mc$minver.jar)
sha256sums=('9610fdb452d3d92e7e51243963ea189f7783c1a7cdd4238de4d2a32c50042a8d'
            '1518d24ed04ae808df085dc8990c699471d6db5eccb4542af8530ed71b2c72eb')

package() {
  install -Dm 2755 $srcdir/$modname-$pkgver-mc$minver.jar $pkgdir/srv/$srvname/mods/$modname.jar

  install -Dm 644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
