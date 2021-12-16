# Maintainer: CuVoodoo <pcb-rnd@cuvoodoo.info>
pkgname=librnd3
pkgver=3.1.0
pkgrel=1
pkgdesc="free/open source, flexible, modular two-dimensional CAD engine"
url="http://www.repo.hu/projects/librnd/"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('gtk2')
optdepends=('gtkglext: GTK2 GUI, opengl render'
            'openmotif: the lesstif gui'
            'libstroke: mouse gestures'
            'fungw: turing complete scripting')
source=("http://www.repo.hu/projects/librnd/releases/librnd-$pkgver.tar.gz")
sha256sums=('2c2a28fc671a7d1aa533d748529a70350d436c0ed7de60b18ea0521eeffb35cb')

build() {
  cd "$srcdir/librnd-$pkgver/"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/librnd-$pkgver/"
  make DESTDIR="$pkgdir/" install
}
