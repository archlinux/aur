# Maintainer: Dominik Opyd <d.opyd@oad.earth>

pkgname=forge-server-balm
modname=balm
srvname=forge
pkgver=4.5.1
minver=1.19
pkgrel=2

url='https://www.curseforge.com/minecraft/mc-mods/balm'
arch=('any')
license=('custom')
pkgdesc="Abstraction Layer (but not really)™ for Blay's multiplatform mods. This is a library mod, it does not add anything on its own."

source=(LICENSE
        https://mediafiles.forgecdn.net/files/3901/901/balm-4.5.1.jar)
depends=("forge-server>=41.1.0"
         "forge-server-hooks>=1.0.0")
noextract=($modname-$pkgver.jar)
sha256sums=('9610fdb452d3d92e7e51243963ea189f7783c1a7cdd4238de4d2a32c50042a8d'
            'e282e469ec7deabfada4243594dceaeedcc1fc077dd4077172251e4446161c59')

package() {
  install -Dm 2755 $srcdir/$modname-$pkgver.jar $pkgdir/srv/$srvname/mods/$modname.jar

  install -Dm 644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
