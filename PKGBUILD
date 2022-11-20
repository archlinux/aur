# Maintainer: CuVoodoo <pcb-rnd@cuvoodoo.info>
pkgname=librnd3
pkgver=3.2.2
pkgrel=1
pkgdesc="free/open source, flexible, modular two-dimensional CAD engine"
url="http://www.repo.hu/projects/librnd/"
arch=('i686' 'x86_64')
license=('GPL2')
optdepends=('gtk2: GTK2 GUI'
            'gtkglext: GTK2 GUI, opengl render'
            'openmotif: the lesstif gui'
            'libstroke: mouse gestures'
            'fungw: turing complete scripting')
source=("http://www.repo.hu/projects/librnd/releases/librnd-$pkgver.tar.gz")
sha256sums=('cbfa25a3fd4419b4f033cb09e446a25ee1b8b4ca7a6a4d0495c29a01b5e11963')

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
