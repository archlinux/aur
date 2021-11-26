# Maintainer: CuVoodoo <pcb-rnd@cuvoodoo.info>
pkgname=librnd3
pkgver=3.0.2
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
source=("http://www.repo.hu/projects/librnd/releases/librnd-$pkgver.tar.gz")
sha256sums=('6800d061dde9f57e825f5bc8f95d87ca00c71ef5ab11e45bca6abdceaa20cc7e')

build() {
  cd "$srcdir/librnd-$pkgver/"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/librnd-$pkgver/"
  make DESTDIR="$pkgdir/" install
}
