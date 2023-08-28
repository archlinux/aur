# Maintainer: Clemens Brunner <clemens dot brunner at gmail dot com>
pkgname=python-biosig
pkgver=2.5.2
pkgrel=1
pkgdesc="Python module for reading and writing routines for different biosignal data formats"
arch=('i686' 'x86_64')
url="http://biosig.sourceforge.net/"
license=('GPL')
depends=('libbiosig' 'python-numpy')
makedepends=('python-setuptools')
source=(https://sourceforge.net/projects/biosig/files/BioSig%20for%20C_C%2B%2B/src/biosig-$pkgver.src.tar.xz)
sha1sums=('7ce96ecdf84e1782619dbf261758ad1bd9e19c46')

build() {
  cd "$srcdir/biosig-$pkgver/biosig4c++/python"
  python setup.py build
}

package() {
  cd "$srcdir/biosig-$pkgver/biosig4c++/python"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
