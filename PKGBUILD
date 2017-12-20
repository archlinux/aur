# Maintainer: Cedric Girard <girard.cedric@gmail.com>
_pythonmod=boto3
pkgname=python2-boto3
pkgver=1.5.3
pkgrel=1
pkgdesc="The AWS SDK for Python"
arch=('any')
url="http://pypi.python.org/pypi/${_pythonmod}"
license=('Apache')
depends=(
    'python2'
    'python2-botocore>=1.8.17'
    'python2-botocore<1.9.0'
    'python2-jmespath>=0.7.1'
    'python2-jmespath<1.0.0'
    'python2-s3transfer>=0.1.10'
    'python2-s3transfer<0.2.0'
    )
makedepends=('python2-setuptools')
source=("https://pypi.io/packages/source/${_pythonmod:0:1}/${_pythonmod}/${_pythonmod}-$pkgver.tar.gz")
md5sums=('40a8d9c0080b85823b8d77015cd5cab1')

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
