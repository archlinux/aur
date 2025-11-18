# Contributor: Letu Ren <fantasquex at gmail dot com>
# Contributor: Peter Mattern <pmattern at arcor dot de>
pkgname='python-pyjwkest'
_name=${pkgname#python-}
pkgver=1.4.4
pkgrel=1
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
sha512sums=('a0692d934e653b0eb0b9bf17f0f1493c241bbd505ce2b3bb480e97d34564c6c6a089eedaa1b23f7b4df4904d7215e7cc90b385b3233290b4cc1de56c2207b92e')

build() {
  cd ${_name}-${pkgver}
  python setup.py build
}

package() {
  cd ${_name}-${pkgver}
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
