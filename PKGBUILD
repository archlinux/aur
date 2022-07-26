# Maintainer: Dominik Opyd <d.opyd@oad.earth>

pkgname=forge-server-mcw-paintings
modname=mcw-paintings
srvname=forge
pkgver=1.0.3
minver=1.19
pkgrel=1

url='https://www.curseforge.com/minecraft/mc-mods/macaws-paintings'
arch=('any')
license=('custom')
pkgdesc="Macaw's Paintings – this mod adds 46 paintings, with a vanila fitting style."

source=(LICENSE
        https://mediafiles.forgecdn.net/files/3828/44/mcw-paintings-1.0.3-mc1.19.jar)
depends=("forge-hooks>=1.0.0"
         "forge-server>=41.0.94")
noextract=($modname-$pkgver-mc$minver.jar)
sha256sums=('9610fdb452d3d92e7e51243963ea189f7783c1a7cdd4238de4d2a32c50042a8d'
            'fd5deedc07adb82bad86d82b6a5e6d81d0568704b8deac326a1bc7b081706553')

package() {
  install -Dm 2755 $srcdir/$modname-$pkgver-mc$minver.jar $pkgdir/srv/$srvname/mods/$modname.jar

  install -Dm 644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
