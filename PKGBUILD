# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Francois Boulogne <fboulogne at april dot org>

pkgname=python-gphoto2
pkgver=1.7.1
pkgrel=1
pkgdesc="Python interface to libgphoto2"
arch=('any')
url="https://pypi.python.org/pypi/gphoto2/"
license=('GPL3')
depends=('python' 'libgphoto2' 'swig')
makedepends=('python-setuptools')
source=(https://github.com/jim-easterbrook/python-gphoto2/archive/v$pkgver.tar.gz)
sha256sums=('cda36c400c64cf6a2cdbb55b35e8e8a72071ad3de821def3b9b56e2248dd2442')

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
