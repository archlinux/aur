# Maintainer: Dominik Opyd <d.opyd@oad.earth>

pkgname=geckolib-forge
pkgver=3.1.10
minver=1.19
groups=(forge-mods minecraft-mods)
pkgrel=1
pkgdesc="GeckoLib is an animation engine for Minecraft Mods."
arch=('any')
url='https://geckolib.com'
license=('MIT')
source=(https://github.com/bernie-g/geckolib/blob/$minver/LICENSE
        https://mediafiles.forgecdn.net/files/3885/232/geckolib-forge-1.19-3.1.10.jar)
depends=('forge-server')
provides=(geckolib=$pkgver)
noextract=($pkgname-$minver-$pkver.jar)
sha256sums=('ae651cfe7715ce791261be76c1b7d1e502c40502b7e2b7658bdac2d64157236b'
            '5db9d3b42a8c9e9abb6c1082e368ddc875ebdd7ea754813dbc2737532776d7c0')

srvpath=/srv/forge

package() {
  install -Dm 2755 $srcdir/geckolib-forge-$minver-$pkgver.jar $pkgdir$srvpath/mods/geckolib.jar

  install -Dm 644 $srcdir/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
