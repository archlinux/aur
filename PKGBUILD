# Maintainer: Clemens Brunner <clemens dot brunner at gmail dot com>
pkgname=python-biosig
pkgver=1.9.5
pkgrel=2
pkgdesc="Python module for reading and writing routines for different biosignal data formats"
arch=('i686' 'x86_64')
url="http://biosig.sourceforge.net/"
license=('GPL')
groups=()
depends=('libbiosig' 'python-numpy' 'python-pkgconfig')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(https://sourceforge.net/projects/biosig/files/BioSig%20for%20C_C%2B%2B/src/biosig4c%2B%2B-1.9.5.src.tar.gz)
noextract=()
sha1sums=('f7f65e4a18585da21394898896f52d7ef768c159')

build() {
  cd "$srcdir/biosig4c++-$pkgver"
  ./configure
  make biosig4python
}

package() {
  cd "$srcdir/biosig4c++-$pkgver/python"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
