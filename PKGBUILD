# Maintainer: Benjamin Voisin <benjamin.voisin@ens-rennes.fr>
pkgname=croco_dc-git
pkgver=latest
pkgrel=2
pkgdesc="A crocodile replacement of sl"
arch=('x86_64')
url="https://gitlab.com/TomSoucies/croco_dc"
groups=()
depends=('ncurses')
makedepends=('git')
replaces=('sl')
source=(${pkgname}::git+https://gitlab.com/TomSoucies/croco_dc.git)
sha256sums=('SKIP')

build() {
  cd "$pkgname/src"
  make
}

package() {
  cd "$pkgname/src"
  mkdir -p $pkgdir/usr/bin
  cp ./sl $pkgdir/usr/bin/
}
