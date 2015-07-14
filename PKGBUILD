# Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=screenfetch-git
_pkgname=screenfetch
pkgver=3.6.5.r141.ge73c7af
pkgrel=1
epoch=1
pkgdesc="CLI Bash script to show system/theme info in screenshots"
arch=('any')
url="https://github.com/KittyKatt/screenFetch"
license=('GPL')
provides=($_pkgname)
conflicts=($_pkgname)
depends=('bash' 'xorg-xdpyinfo' 'xorg-xprop')
optdepends=('scrot: To take screenshot')
makedepends=('git')
source=("$pkgname::git+https://github.com/KittyKatt/screenFetch.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags --long | sed -r -e 's,^[^0-9]*,,;s,([^-]*-g),r\1,;s,[-_],.,g'
}

package() {
  cd $pkgname
  install -Dm755 "screenfetch-dev" "$pkgdir/usr/bin/screenfetch"
  install -Dm644 "screenfetch.1" "$pkgdir/usr/share/man/man1/screenfetch.1"
}
