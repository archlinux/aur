# Maintainer: Andrea Ratto <andrearatto_liste@yahoo.it>

_pythonmod=boto3
pkgname=python-boto3
pkgver=1.3.0
pkgrel=1
pkgdesc="The AWS SDK for Python"
arch=('any')
url="http://pypi.python.org/pypi/${_pythonmod}"
license=('Apache')
depends=('python' 'python-botocore' 'python-jmespath')
makedepends=('python2-setuptools')
source=("https://pypi.python.org/packages/source/${_pythonmod:0:1}/${_pythonmod}/${_pythonmod}-$pkgver.tar.gz")
md5sums=('b5a6cc7dc0e0c0969944f65db7f7b07f')

build() {
  cd ${srcdir}/${_pythonmod}-$pkgver
  python setup.py build
}

check() {
  cd ${srcdir}/${_pythonmod}-$pkgver
  python setup.py test
}

package() {
  cd ${srcdir}/${_pythonmod}-$pkgver
  python setup.py install --root=${pkgdir}
}

