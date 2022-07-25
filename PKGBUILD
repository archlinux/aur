# Maintainer: Dominik Opyd <d.opyd@oad.earth>

pkgname=curios-forge
pkgver=5.1.0.4
minver=1.19
pkgrel=1
pkgdesc="Curios is a flexible and expandable accessory/equipment API for users and developers."
arch=('any')
url='https://www.curseforge.com/minecraft/mc-mods/curios'
source=(https://github.com/TheIllusiveC4/Curios/blob/$minver.x/LICENSE
        https://mediafiles.forgecdn.net/files/3871/347/curios-forge-1.19-5.1.0.4.jar)
license=('LGPL-3.0')
depends=("forge-hooks>=1.0.0"
         "forge-server>=41.0.94")
provides=(curios=$pkgver)
noextract=($pkgname-$minver-$pkver.jar)
sha256sums=('ae651cfe7715ce791261be76c1b7d1e502c40502b7e2b7658bdac2d64157236b'
            'ac80177420900486f6cca6e6a78d0aaa71fe18f86e951384ab24fb87fc3e4140')
groups=(forge-mods minecraft-mods)

package() {
  local srvpath=/srv/forge

  install -Dm 2755 $srcdir/$pkgname-$minver-$pkgver.jar $pkgdir$srvpath/mods/$pkgname.jar

  install -Dm 644 $srcdir/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
