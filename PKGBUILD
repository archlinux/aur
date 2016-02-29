# Maintainer: Cedric Girard <girard.cedric@gmail.com>
_pythonmod=Safe
pkgname=python2-safe
pkgver=0.4
pkgrel=1
pkgdesc="Check the password strength for you."
arch=('any')
url="http://pypi.python.org/pypi/${_pythonmod}"
license=('Apache')
depends=('python2')
makedepends=('python2-setuptools')
source=("https://pypi.python.org/packages/source/${_pythonmod:0:1}/${_pythonmod}/${_pythonmod}-$pkgver.tar.gz")
md5sums=('670ef3588b98f878dd1b38b13d8f677d')

build() {
  cd ${srcdir}/${_pythonmod}-$pkgver
  python2 setup.py build
}

check() {
  cd ${srcdir}/${_pythonmod}-$pkgver
  python2 setup.py test
}

package() {
  cd ${srcdir}/${_pythonmod}-$pkgver
  python2 setup.py install --root=${pkgdir}
}
