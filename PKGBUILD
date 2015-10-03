# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Francois Boulogne <fboulogne at april dot org>

pkgname=python-gphoto2
pkgver=1.2.2
pkgrel=1
pkgdesc="Python interface to libgphoto2"
arch=('any')
url="https://pypi.python.org/pypi/gphoto2/"
license=('GPL3')
depends=('python' 'libgphoto2' 'swig')
makedepends=('python-setuptools')
source=(https://github.com/jim-easterbrook/python-gphoto2/archive/v$pkgver.tar.gz)
sha256sums=('d942df8331c5daf8fc6d285804228e8a6170c81cecc235495a7e53e9cfe961ab')

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
