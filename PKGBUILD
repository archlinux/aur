# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Francois Boulogne <fboulogne at april dot org>

pkgname=python-gphoto2
pkgver=1.2.1
pkgrel=1
pkgdesc="Python interface to libgphoto2"
arch=('any')
url="https://bibtexparser.readthedocs.org/"
license=('GPL3')
depends=('python' 'libgphoto2' 'swig')
makedepends=('python-setuptools')
source=(https://github.com/jim-easterbrook/python-gphoto2/archive/v$pkgver.tar.gz)
sha256sums=('69143b1eb39de442eb48cb91951c54bd46ee55b0567abbd49ecce9d44c7136b3')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build_swig
  python setup.py build
}

package(){
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:ts=2:sw=2:et:
