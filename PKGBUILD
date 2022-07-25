# Maintainer: Dominik Opyd <d.opyd@oad.earth>

pkgname=patchouli-forge
pkgver=0.0.75
minver=1.19
pkgrel=2
pkgdesc="Patchouli is a mod that aims to provide easy to implement, data-driven documentation for minecraft modders and modpack makers alike."
arch=('any')
url='https://www.curseforge.com/minecraft/mc-mods/patchouli'
source=(https://github.com/VazkiiMods/Patchouli/blob/$minver.x/LICENSE
        https://mediafiles.forgecdn.net/files/3877/555/Patchouli-1.19-75.jar)
license=('MIT')
depends=(forge-hooks forge-server)
provides=(patchouli=$pkgver)
noextract=(Patchouli-$minver-75.jar)
groups=(forge-mods minecraft-mods)
sha256sums=('ae651cfe7715ce791261be76c1b7d1e502c40502b7e2b7658bdac2d64157236b'
            'ce8dc7f0d2d2b4dca0071a7cb36a9c8ade355d81607ea653a00f42972a47e790')

srvpath=/srv/forge

package() {
  install -Dm 2755 $srcdir/Patchouli-1.19-75.jar $pkgdir$srvpath/mods/$pkgbase.jar

  install -Dm 644 $srcdir/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
