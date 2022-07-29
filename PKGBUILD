# Maintainer: Dominik Opyd <d.opyd@oad.earth>

pkgname=forge-server-patchouli
modname=patchouli
srvname=forge
pkgver=0.0.75
minver=1.19
pkgrel=1

url='https://www.curseforge.com/minecraft/mc-mods/patchouli'
arch=('any')
license=('MIT')
pkgdesc="Patchouli is a mod that aims to provide easy to implement, data-driven documentation for minecraft modders and modpack makers alike."

source=(https://github.com/VazkiiMods/Patchouli/blob/$minver.x/LICENSE
        https://mediafiles.forgecdn.net/files/3877/555/Patchouli-1.19-75.jar)
depends=("forge-server=41.1.0"
         "forge-server-hooks=1.0.0")
noextract=(Patchouli-1.19-75.jar)
sha256sums=('ae651cfe7715ce791261be76c1b7d1e502c40502b7e2b7658bdac2d64157236b'
            'ce8dc7f0d2d2b4dca0071a7cb36a9c8ade355d81607ea653a00f42972a47e790')

provides=(patchouli-forge)
replaces=(patchouli-forge)
conflicts=(patchouli-forge)

package() {
  install -Dm 2755 $srcdir/Patchouli-1.19-75.jar $pkgdir/srv/$srvname/mods/$modname.jar

  install -Dm 644 $srcdir/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
