# Maintainer: CuVoodoo <pcb-rnd@cuvoodoo.info>
pkgname=librnd3-svn
pkgver=r33757
pkgrel=1
pkgdesc="free/open source, flexible, modular two-dimensional CAD engine"
url="http://www.repo.hu/projects/librnd/"
arch=('i686' 'x86_64')
license=('GPL2')
optdepends=('gtk2: GTK2 GUI, software render'
            'gtkglext: GTK2 GUI, opengl render'
            'openmotif: the lesstif gui'
            'libstroke: mouse gestures'
            'fungw: turing complete scripting')
makedepends=('subversion')
provides=('librnd3')
source=("svn://svn.repo.hu/librnd/trunk")
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
