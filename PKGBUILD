# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=la-mulana-hib
pkgver=1.5.5.2
pkgrel=1
pkgdesc='A "Ruins Exploration Archaeological action game" in which the player seeks the "Anthropo-origin"'
url="http://la-mulana.com/en/"
license=('custom: commercial')
arch=('x86_64' 'i686')
depends=('sh')
depends_i686=('sdl2' 'openal')
depends_x86_64=('lib32-sdl2' 'lib32-openal')
source=("hib://LaMulanaSetup-2015-04-01.sh"
        "$pkgname.sh")
sha256sums=('e189640c264f4c560faa472d6c26834347c6913cc07c54056852d1ebf5240573'
            'a91456f76ff7dccbbd844089e8eac8e8fd85074239954949ad6ec7f421c55dc2')
PKGEXT=".pkg.tar"

package() {
  install -d "$pkgdir"/opt/la-mulana
  # data
  cp -rup data/noarch/* "$pkgdir"/opt/la-mulana
  # binary
  install -m755 data/x86/LaMulana.bin.x86 "$pkgdir"/opt/la-mulana
  # launcher
  install -Dm755 $pkgname.sh "$pkgdir"/usr/bin/la-mulana
}
