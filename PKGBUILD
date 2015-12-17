# Maintainer: Cedric Girard <girard.cedric@gmail.com>
_pythonmod=vcrpy
pkgname=python2-vcr
pkgver=1.7.4
pkgrel=2
pkgdesc="Automatically mock your HTTP interactions to simplify and speed up testing"
arch=('any')
url="http://pypi.python.org/pypi/${_pythonmod}"
license=('MIT')
depends=('python2' 'python2-yaml' 'python2-wrapt' 'python2-six>=1.5' 'python2-contextlib2' 'python2-mock')
makedepends=('python2-setuptools')
#checkdepends=('python2-pytest-localserver')
source=("https://pypi.python.org/packages/source/${_pythonmod:0:1}/${_pythonmod}/${_pythonmod}-$pkgver.tar.gz")
md5sums=('27fde8879e74e670fe9142a195249f2a')

build() {
  cd ${srcdir}/${_pythonmod}-$pkgver
  find tests -name '*.pyc' -delete
  python2 setup.py build
}

#check() {
#  cd ${srcdir}/${_pythonmod}-$pkgver
#  python2 setup.py test
#}

package() {
  cd ${srcdir}/${_pythonmod}-$pkgver
  python2 setup.py install --root=${pkgdir}
}
