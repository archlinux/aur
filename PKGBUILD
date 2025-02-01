# Maintainer: CuVoodoo <pcb-rnd@cuvoodoo.info>
pkgname=librnd4
pkgver=4.3.1
pkgrel=2
pkgdesc="free/open source, flexible, modular two-dimensional CAD engine"
url="http://www.repo.hu/projects/librnd/"
arch=('x86_64')
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
sha256sums=('2bc3b21d1942cbf7116cecf7f1c212450bd9c944b992b79ef937f241ec8b2af9')

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
