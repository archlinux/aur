# Maintainer: Alexander Schmidt <alex@treefish.org>

pkgname=lingot-hg
pkgver=r374.7ed4f5d21d15
pkgrel=6
pkgdesc="LINGOT is a musical instrument tuner."
arch=('i686' 'x86_64')
url="http://www.nongnu.org/lingot/"
license=('GPL2')
source=('hg+http://hg.sv.gnu.org/hgweb/lingot')
depends=('gtk2' 'libglade')
makedepends=('mercurial' 'intltool')
md5sums=('SKIP')

pkgver() {
  cd $srcdir/lingot
  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

build() {
  cd $srcdir/lingot
  ./configure --prefix=/usr
  make
}

package() {
  cd $srcdir/lingot
  make DESTDIR="$pkgdir" install 
}
