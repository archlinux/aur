# Maintainer: Ilya Basin <basinilya at gmail dot com>

pkgname=cdemu-autostart-git
pkgver=20190111.r4.gf3d3606
pkgrel=1
pkgdesc="Keep mounted images after restart"
arch=(any)
url="https://github.com/basinilya/cdemu-autostart"
license=('custom')
depends=('cdemu-client')
makedepends=('git')
install="${pkgname}.install"
source=("$pkgname::git+https://github.com/basinilya/cdemu-autostart.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  # cutting off 'v' prefix that presents in the git tag
  git describe --long --always --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
