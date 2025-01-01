# Contributor: Letu Ren <fantasquex at gmail dot com>
# Contributor: Poscat <poscat@mail.poscat.moe>

pkgname='python-pyoidc'
_name=${pkgname#python-}
pkgver=1.7.0
pkgrel=2
pkgdesc='A complete OpenID Connect implementation in Python'
arch=('any')
url='https://github.com/CZ-NIC/pyoidc'
license=('Apache')
depends=(
  'python'
  'python-requests'
  'python-pycryptodomex'
  'python-pydantic-settings'
  'python-pyjwkest'
  'python-cryptography'
  'python-defusedxml'
  'python-typing_extensions'
)
makedepends=(python-build python-installer python-wheel python-setuptools)
#checkdepends=('python-pytest' 'python-pytest-runner')
source=(${_name}-${pkgver}.tar.gz::"https://github.com/CZ-NIC/pyoidc/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('a03c7717ef30bd8490b1848922bd08b4557177696ed0e7eab7fec73fc784e3d1')

build() {
  cd ${_name}-${pkgver}
  python -m build --wheel --no-isolation
}

#check() {
#  cd ${_name}-${pkgver}
#  python setup.py pytest
#}

package() {
  cd ${_name}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
