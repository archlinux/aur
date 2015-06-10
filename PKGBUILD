# Maintainer: Francois Boulogne <fboulogne at april dot org>
pkgname=gentorrent-git
pkgver=r35.9e49248
pkgrel=1
pkgdesc="A torrent generator"
arch=('i686' 'x86_64')
url="http://tanguy.ortolo.eu/"
license=('AGPLv3')
depends=('')
optdepends=()
makedepends=('git')
provides=()
conflicts=()
source=("git://git.ortolo.eu/gentorrent.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/gentorrent"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/gentorrent"
  install -Dm755 gentorrent.py ${pkgdir}/usr/bin/gentorrent
  install -Dm644 COPYING "${pkgdir}"/usr/share/licenses/"${pkgname}"/COPYING
}

# vim:set ts=2 sw=2 et:
