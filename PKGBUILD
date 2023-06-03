# Maintainer: Letu Ren <fantasquex at gmail dot com>
# Contributor: Poscat <poscat@mail.poscat.moe>

pkgname='python-pyoidc'
_name=${pkgname#python-}
pkgver='1.6.0'
pkgrel=1
pkgdesc='A complete OpenID Connect implementation in Python'
arch=('any')
url='https://github.com/CZ-NIC/pyoidc'
license=('Apache')
depends=(
  'python'
  'python-requests'
  'python-pycryptodomex'
  'python-pydantic'
  'python-pyjwkest'
  'python-mako'
  'python-cryptography'
  'python-defusedxml'
)
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-pytest-runner')
source=("https://github.com/CZ-NIC/pyoidc/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('756602451375d293e0e516bc43f0551627edd8be1ea1378ac898cbc8eaec9c35')

build() {
  cd ${_name}-${pkgver}
  python setup.py build
}

package() {
  cd ${_name}-${pkgver}
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

check() {
  cd ${_name}-${pkgver}
  python setup.py pytest
}

