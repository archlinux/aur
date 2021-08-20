# Maintainer: CuVoodoo <pcb-rnd@cuvoodoo.info>
# Contributor: Kyle Keen <keenerd@gmail.com?>
pkgname=pcb-rnd-svn
pkgver=r35263
pkgrel=1
pkgdesc="free/open source, flexible, modular Printed Circuit Board editor"
url="http://www.repo.hu/projects/pcb-rnd/"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('librnd3' 'libxml2')
optdepends=('gd: gd based exports and pixmap imports (png, gif, jpeg)'
            'freetype2: import_ttf plugin'
            'fungw')
makedepends=('subversion')
provides=('pcb-rnd')
source=("svn://svn.repo.hu/pcb-rnd/trunk")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/trunk/"
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

build() {
  cd "$srcdir/trunk/"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/trunk/"
  make DESTDIR="$pkgdir/" install
}
