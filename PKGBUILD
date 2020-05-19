# Maintainer: Clemens Brunner <clemens dot brunner at gmail dot com>
pkgname=python-biosig
pkgver=2.0.2
pkgrel=1
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
source=(https://sourceforge.net/projects/biosig/files/BioSig%20for%20C_C%2B%2B/src/biosig4c%2B%2B-$pkgver.src.tar.gz)
noextract=()
sha1sums=('a0f790e2e59d6e35a7ed618e02e98a8db571c235')

build() {
  cd "$srcdir/biosig4c++-$pkgver"
  ./configure
  make biosig4python
}

package() {
  cd "$srcdir/biosig4c++-$pkgver/python"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
