# Maintainer: Dominik Opyd <d.opyd@oad.earth>

pkgname=forge-server-mcw-fences
modname=mcw-fences
srvname=forge
pkgver=1.0.5
minver=1.19
pkgrel=1

url='https://www.curseforge.com/minecraft/mc-mods/macaws-fences-and-walls'
arch=('any')
license=('custom')
pkgdesc="We all know Minecraft could use more styled fences, walls and gates. Well I guess I've got good news for you! This mod adds new vanila styled fences, walls and gates."

source=(LICENSE
        https://mediafiles.forgecdn.net/files/3827/696/mcw-fences-1.0.5-mc1.19.jar)
depends=("forge-hooks>=1.0.0"
         "forge-server>=41.0.94")
noextract=($modname-$pkgver-mc$minver.jar)
sha256sums=('9610fdb452d3d92e7e51243963ea189f7783c1a7cdd4238de4d2a32c50042a8d'
            'a8ce7510358a31ac1a38786f7a8ee6145ca8594a831374e89bab8297dce2076b')

package() {
  install -Dm 2755 $srcdir/$modname-$pkgver-mc$minver.jar $pkgdir/srv/$srvname/mods/$modname.jar

  install -Dm 644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
