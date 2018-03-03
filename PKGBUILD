# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Francois Boulogne <fboulogne at april dot org>

pkgname=python-gphoto2
pkgver=1.8.2
pkgrel=1
pkgdesc="Python interface to libgphoto2"
arch=('any')
url="https://pypi.python.org/pypi/gphoto2/"
license=('GPL3')
depends=('python' 'libgphoto2' 'swig')
makedepends=('python-setuptools')
source=(https://github.com/jim-easterbrook/python-gphoto2/archive/v$pkgver.tar.gz)
sha256sums=('92c16a1d926d30f6500a24861ff596e47508db69dc29bc6e065dcd65d0fde933')

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
