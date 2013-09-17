# Maintainer: carstene1ns <arch carsten-teibes de>
# Contributor: openSUSE build service Contributors

pkgname=eduke32-shareware-episode
pkgver=1.3
pkgrel=1
pkgdesc="Duke Nukem 3D shareware episode for EDuke32"
arch=('i686' 'x86_64')
url="http://3drealms.com/"
license=('shareware')
depends=('eduke32')
makedepends=('unzip')
source=("ftp://ftp.3drealms.com/share/3dduke13.zip")
md5sums=('04e4ca70b8a2d59ed56c451c5c1d5d39')
sha256sums=('c67efd179022bc6d9bde54f404c707cbcbdc15423c20be72e277bc2bdddf3d0e')

build() {
  cd "$srcdir"

  # extract episode files
  unzip -Luq "DN3DSW13.SHR" defs.con duke.rts game.con license.txt user.con duke3d.grp
}

package() {
  cd "$srcdir"

  # install files
  install -Dm644 license.txt "$pkgdir/usr/share/licenses/$pkgname/license.txt"
  mkdir -p "$pkgdir/usr/share/games/eduke32"
  install -m644 defs.con duke.rts game.con user.con duke3d.grp "$pkgdir/usr/share/games/eduke32"
}
