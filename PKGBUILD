# Maintainer: Clemens Brunner <clemens dot brunner at gmail dot com>
pkgname=python-biosig
pkgver=2.2.0
pkgrel=1
pkgdesc="Python module for reading and writing routines for different biosignal data formats"
arch=('i686' 'x86_64')
url="http://biosig.sourceforge.net/"
license=('GPL')
groups=()
depends=('libbiosig' 'python-numpy' 'python-pkgconfig')
makedepends=('python-wheel')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(https://sourceforge.net/projects/biosig/files/BioSig%20for%20C_C%2B%2B/src/biosig-$pkgver.src.tar.gz)
noextract=()
sha1sums=('f5ad09444ef271b5ec33be0dd6f9c9215c46df8a')

build() {
  cd "$srcdir/biosig-$pkgver"
  ./configure
  make python
}

package() {
  cd "$srcdir/biosig-$pkgver/biosig4c++/python"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
