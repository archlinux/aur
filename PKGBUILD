# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=woahdave-hib
pkgver=20141105
pkgrel=1
pkgdesc="JUMP AND THROW AND DON'T DIE! WOAH DAVE!"
url="http://woahdave.com/"
license=('custom: commercial')
arch=('x86_64' 'i686')
depends=('sh')
depends_i686=('sdl2_mixer' 'libgl')
depends_x86_64=('lib32-sdl2_mixer' 'lib32-libgl')
makedepends=('chrpath')
source=("hib://woahdave_linux.zip"
        "$pkgname.sh")
sha256sums=('d99b42a4a6da6b37e75cd84c60d6ea693a394767bbd15c517d4924331ed64be9'
            'e78d41b49475e0ec15f789072d1572689d9a2c213a9a82710fcdc7e87e0e712c')
PKGEXT=".pkg.tar"

package() {
  install -d "$pkgdir"/opt/woahdave/Bundle
  # data
  cd "Linux/WoahDave-Humble-Release-20141105 1"
  install -m 644 Bundle/* "$pkgdir"/opt/woahdave/Bundle
  # binary
  install -m755 WoahDave "$pkgdir"/opt/woahdave
  chrpath -d "$pkgdir"/opt/woahdave/WoahDave
  # launcher
  install -Dm755 "$srcdir"/$pkgname.sh "$pkgdir"/usr/bin/woahdave
}
