# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Francois Boulogne <fboulogne at april dot org>

pkgname=python2-gphoto2
_pkgname=python-gphoto2
pkgver=1.2.1
pkgrel=1
pkgdesc="python interface to libgphoto2"
arch=('any')
url="https://bibtexparser.readthedocs.org/"
license=('GPL3')
depends=('python2' 'libgphoto2' 'swig')
makedepends=('python2-setuptools')
source=(https://github.com/jim-easterbrook/python-gphoto2/archive/v$pkgver.tar.gz)
sha256sums=('69143b1eb39de442eb48cb91951c54bd46ee55b0567abbd49ecce9d44c7136b3')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py build_swig
  python2 setup.py build
}

package(){
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:ts=2:sw=2:et:
