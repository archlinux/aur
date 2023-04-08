# Maintainer: Atom Long <atom.long@hotmail.com>

_pkgname=pycognito
pkgname=python-pycognito
pkgver=2022.12.0
pkgrel=1
pkgdesc='Python library for using AWS Cognito.'
url='https://pypi.org/project/pycognito'
arch=('any')
license=('Apache')
depends=('python-boto3' 'python-envs' 'python-jose' 'python-six' 'python-requests')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-pytest-runner' 'python-pytest-mock' 'python-pytest-timeout'
              'python-wheel' 'python-pip' 'python-mock')
source=("${_pkgname}-${pkgver}.tar.gz"::"https://github.com/pvizeli/pycognito/archive/${pkgver}.tar.gz")
sha256sums=('af97626d9e2b3593e27d145ef225d08786b1f0ee66fdb5411128ee5081d38726')

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
