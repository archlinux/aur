# Maintainer: Atom Long <atom.long@hotmail.com>

_pkgname=pycognito
pkgname=python-pycognito
pkgver=2021.03.1
pkgrel=1
pkgdesc='Python library for using AWS Cognito.'
url='https://pypi.org/project/pycognito'
arch=('any')
license=('Apache')
depends=('python-boto3' 'python-jose' 'python-six' 'python-requests')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-pytest-runner' 'python-pytest-mock' 'python-pytest-timeout'
              'python-wheel' 'python-pip' 'python-mock')
source=("${_pkgname}-${pkgver}.tar.gz"::"https://github.com/pvizeli/pycognito/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('9fdfef44e5ec4a57b48d9cc783fd59f59b2b7c07a30a33d202162b2d2749c6cb')

build() {
  cd ${_pkgname}-${pkgver}
  python setup.py build
}

check() {
  cd ${_pkgname}-${pkgver}
  python setup.py test
}

package() {
  cd ${_pkgname}-${pkgver}
  python setup.py install --root="${pkgdir}" -O1 --skip-build
}

# vim: ts=2 sw=2 et:
