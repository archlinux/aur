# Maintainer: Dominik Opyd <d.opyd@oad.earth>

pkgname=forge-server-torchmaster
modname=torchmaster
srvname=forge
pkgver=19.0.2
minver=1.19
pkgrel=2

url='https://www.curseforge.com/minecraft/mc-mods/torchmaster'
arch=('any')
license=('MIT')
pkgdesc="Adds a special torch which prevents mob spawning in a configurable radius."

source=(https://github.com/Xalcon/TorchMaster/blob/mc/1.19/LICENSE
        https://mediafiles.forgecdn.net/files/3890/66/torchmaster-19.0.2-beta.jar)
depends=("forge-server"
         "forge-server-hooks")
noextract=($modname-$pkgver-beta.jar)
sha256sums=('9610fdb452d3d92e7e51243963ea189f7783c1a7cdd4238de4d2a32c50042a8d'
            'ed16d79be21d79a086d9b125d01da8eda168a801a538d04a4f93d558e81d2f6a')

package() {
  install -Dm 2755 $srcdir/$modname-$pkgver-beta.jar $pkgdir/srv/$srvname/mods/$modname.jar

  install -Dm 644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
