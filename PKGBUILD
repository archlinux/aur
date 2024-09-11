# Maintainer: Clemens Brunner <clemens dot brunner at gmail dot com>
pkgname=python-biosig
pkgver=2.6.1
pkgrel=1
pkgdesc="Python module for reading and writing routines for different biosignal data formats"
arch=('i686' 'x86_64')
url="http://biosig.sourceforge.net/"
license=('GPL')
groups=()
depends=('libbiosig' 'python-numpy')
makedepends=('python-setuptools')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(https://sourceforge.net/projects/biosig/files/BioSig%20for%20C_C%2B%2B/src/biosig-$pkgver.src.tar.xz)
noextract=()
sha1sums=('73f7b24a48a84a3cc40c1e20285e9952cbd93268')

build() {
  cd "$srcdir/biosig-$pkgver"
  ./configure
  cd biosig4c++/python
  python setup.py build
}

package() {
  cd "$srcdir/biosig-$pkgver/biosig4c++/python"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
