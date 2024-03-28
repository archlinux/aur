# Maintainer: CuVoodoo <pcb-rnd@cuvoodoo.info>
pkgname=librnd4
pkgver=4.1.1
pkgrel=2
pkgdesc="free/open source, flexible, modular two-dimensional CAD engine"
url="http://www.repo.hu/projects/librnd/"
arch=('i686' 'x86_64')
license=('GPL2')
depends=(glibc bash)
optdepends=('gtk2: GTK2 GUI'
            'gtkglext: GTK2 GUI, OpenGL render'
            'libepoxy: GTK4 GUI'
            'openmotif: the lesstif GUI'
            'libstroke: mouse gestures'
            'gd: to export/import to/from png, jpg or gif'
            'fungw: turing complete scripting')
source=("http://www.repo.hu/projects/librnd/releases/librnd-$pkgver.tar.gz")
sha256sums=('39bb8a41b5fdc3aa2cd79f4106df14d4409103ead90d96608a9dcca57fbbffc4')

build() {
  cd "$srcdir/librnd-$pkgver/"
  ./configure --prefix=/usr
  make
}

check() {
  cd "$srcdir/librnd-$pkgver/"
  make test
}
 
package() {
  cd "$srcdir/librnd-$pkgver/"
  make DESTDIR="$pkgdir/" install
}
