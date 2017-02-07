# Maintainer: Andrea Ratto <andrearatto_liste@yahoo.it>

_pythonmod=boto3
pkgname=python-boto3
pkgver=1.4.4
pkgrel=1
pkgdesc="The AWS SDK for Python"
arch=('any')
url="http://pypi.python.org/pypi/${_pythonmod}"
license=('Apache')
depends=(
    'python>=3.0'
    'python-botocore>=1.5.0' 'python-botocore<1.6.0'
    'python-jmespath>=0.7.1' 'python-jmespath<1.0.0'
    'python-s3transfer>=0.1.10' 'python-s3transfer<0.2.0')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pythonmod:0:1}/${_pythonmod}/${_pythonmod}-$pkgver.tar.gz")
md5sums=('3783681b144552724abb4c35152e8975')

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

