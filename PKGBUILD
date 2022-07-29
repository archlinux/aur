# Maintainer: Dominik Opyd <d.opyd@oad.earth>

pkgname=forge-server-geckolib
modname=geckolib
srvname=forge
pkgver=3.1.11
minver=1.19
pkgrel=1

url='https://www.curseforge.com/minecraft/mc-mods/goblin-traders'
arch=('any')
license=('MIT')
pkgdesc="GeckoLib is an animation engine for Minecraft Mods, with support for complex 3D keyframe-based animations, 30+ easings, concurrent animation support, sound and particle keyframes, event keyframes, and more."

source=(https://github.com/bernie-g/geckolib/blob/$minver/LICENSE
        https://mediafiles.forgecdn.net/files/3904/147/geckolib-forge-1.19-3.1.11.jar)
depends=("forge-server-hooks>=1.0.0"
         "forge-server>=41.0.98")
noextract=($modname-$srvname-$minver-$pkgver.jar)
sha256sums=('ae651cfe7715ce791261be76c1b7d1e502c40502b7e2b7658bdac2d64157236b'
            'd5935397d6e103c60019fa031fb7407cfe67437ed814d7d2784e7d8d40a6bf05')

provides=(geckolib-forge forge-server-geckolib)
replaces=(geckolib-forge)
conflicts=(geckolib-forge)

package() {
  install -Dm 2755 $srcdir/$modname-$srvname-$minver-$pkgver.jar $pkgdir/srv/$srvname/mods/$modname.jar

  install -Dm 644 $srcdir/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
