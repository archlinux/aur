# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Francois Boulogne <fboulogne at april dot org>
pkgname=gentorrent-git
pkgver=r35.9e49248
pkgrel=2
pkgdesc="A torrent generator"
arch=('i686' 'x86_64' 'aarch64')
url="http://tanguy.ortolo.eu/"
license=('AGPLv3')
makedepends=('git')
source=("git+https://git.ortolo.eu/git/gentorrent.git")
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
