# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Francois Boulogne <fboulogne at april dot org>

pkgname=python2-gphoto2
_pkgname=python-gphoto2
pkgver=1.5.1
pkgrel=1
pkgdesc="python interface to libgphoto2"
arch=('any')
url="https://pypi.python.org/pypi/gphoto2/"
license=('GPL3')
depends=('python2' 'libgphoto2' 'swig')
makedepends=('python2-setuptools')
source=(https://github.com/jim-easterbrook/python-gphoto2/archive/v$pkgver.tar.gz)
sha256sums=('f2cb7b0755d21d4aa92db7f1af2ee3ce116da3436dfe984f94bc785339a2904c')

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
