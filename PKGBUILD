# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Francois Boulogne <fboulogne at april dot org>

pkgname=python2-gphoto2
_pkgname=python-gphoto2
pkgver=1.4.0
pkgrel=1
pkgdesc="python interface to libgphoto2"
arch=('any')
url="https://pypi.python.org/pypi/gphoto2/"
license=('GPL3')
depends=('python2' 'libgphoto2' 'swig')
makedepends=('python2-setuptools')
source=(https://github.com/jim-easterbrook/python-gphoto2/archive/v$pkgver.tar.gz)
sha256sums=('04aa2398e05f5c3c27f7884f072ca2121e3c682163a9b74129d37e3db739a1e4')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py build_swig
  python2 setup.py build
}

package(){
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  rm -rf $pkgdir/usr/share/
}

# vim:ts=2:sw=2:et:
