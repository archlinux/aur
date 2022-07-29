# Maintainer: Dominik Opyd <d.opyd@oad.earth>

pkgname=forge-server-curios
modname=curios
srvname=forge
pkgver=5.1.0.4
minver=1.19
pkgrel=1

url='https://www.curseforge.com/minecraft/mc-mods/curios'
arch=('any')
license=('GPL')
pkgdesc="Curios is a flexible and expandable accessory/equipment API for users and developers."

source=(https://github.com/TheIllusiveC4/Curios/blob/$minver.x/LICENSE
        https://mediafiles.forgecdn.net/files/3871/347/curios-forge-1.19-5.1.0.4.jar)
depends=("forge-server=41.1.0"
         "forge-server-hooks=1.0.0")
noextract=($modname-$srvname-$minver-$pkgver.jar)
sha256sums=('ae651cfe7715ce791261be76c1b7d1e502c40502b7e2b7658bdac2d64157236b'
            'ac80177420900486f6cca6e6a78d0aaa71fe18f86e951384ab24fb87fc3e4140')

provides=(curios-forge)
replaces=(curios-forge)
conflicts=(curios-forge)

package() {
  install -Dm 2755 $srcdir/$modname-$srvname-$minver-$pkgver.jar $pkgdir/srv/$srvname/mods/$modname.jar

  install -Dm 644 $srcdir/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
