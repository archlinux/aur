# Maintainer: carstene1ns <arch carsten-teibes de>
# Contributor: openSUSE build service Contributors

pkgname=eduke32-shareware-episode
pkgver=1.3
pkgrel=1
pkgdesc="Duke Nukem 3D shareware episode for EDuke32"
arch=('any')
url="http://3drealms.com/"
license=('custom: shareware')
depends=('eduke32')
makedepends=('unzip')
source=("http://dukeworld.duke4.net/classic%20dukeworld/share/3dduke13.zip")
sha256sums=('c67efd179022bc6d9bde54f404c707cbcbdc15423c20be72e277bc2bdddf3d0e')

prepare() {
  # extract episode files
  unzip -Luq "DN3DSW13.SHR" defs.con duke.rts game.con license.txt user.con duke3d.grp
}

package() {
  # data
  install -d "$pkgdir"/usr/share/games/eduke32
  install -m644 duke.rts {defs,game,user}.con duke3d.grp "$pkgdir"/usr/share/games/eduke32
  # license
  install -Dm644 license.txt "$pkgdir"/usr/share/licenses/$pkgname/license.txt
}
