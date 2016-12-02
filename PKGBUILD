# Maintainer: Cedric Girard <girard.cedric@gmail.com>
_pythonmod=boto3
pkgname=python2-boto3
pkgver=1.4.2
pkgrel=1
pkgdesc="The AWS SDK for Python"
arch=('any')
url="http://pypi.python.org/pypi/${_pythonmod}"
license=('Apache')
depends=(
    'python2'
    'python2-botocore>=1.4.1'
    'python2-botocore<1.5.0'
    'python2-jmespath<1.0.0'
    'python2-s3transfer>=0.1.0'
    'python2-s3transfer<0.2.0'
    )
makedepends=('python2-setuptools')
source=("https://pypi.io/packages/source/${_pythonmod:0:1}/${_pythonmod}/${_pythonmod}-$pkgver.tar.gz")
md5sums=('afed98def1ee5b98bc693913ac97438c')

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
