# Maintainer: CuVoodoo <pcb-rnd@cuvoodoo.info>
pkgname=librnd3
pkgver=3.1.2
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
sha256sums=('7e0b243795e587836a47690ea00e02695e9b17f3d16c40a89c5b36a68baa6d11')

build() {
  cd "$srcdir/librnd-$pkgver/"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/librnd-$pkgver/"
  make DESTDIR="$pkgdir/" install
}
