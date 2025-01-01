# Contributor: Letu Ren <fantasquex at gmail dot com>
# Contributor: Peter Mattern <pmattern at arcor dot de>
pkgname='python-pyjwkest'
_name=${pkgname#python-}
pkgver=1.4.2
pkgrel=3
pkgdesc='Implementation of JWT, JWS, JWE and JWK'
arch=('any')
url="https://github.com/rohe/${_name}"
license=('Apache')
depends=(
  'python'
  'python-pycryptodomex'
  'python-requests'
  'python-six'
)
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=('2d2c8bcd77697850e92ae6c61ac6884cc5f6b62f6104d5f98acf3c0c07f8537cad1dcabd6840f36fcacdbabc04e85f069f94e400bc1aecaa6cb7710aeeb4cf13')

build() {
  cd ${_name}-${pkgver}
  python setup.py build
}

package() {
  cd ${_name}-${pkgver}
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
