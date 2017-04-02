# Maintainer: xRemaLx <anton.komolov@gmail.com>

pkgname=python-treq
_name=treq
pkgver=17.3.1
pkgrel=1
arch=('any')
pkgdesc="A requests-like API built on top of twisted.web's Agent"
url="http://github.com/twisted/treq"
license=('MIT/X')
depends=('python-attrs' 'python-twisted' 'python-six' 'python-requests' 'python-incremental')
source=(
  "https://files.pythonhosted.org/packages/py2.py3/${_name::1}/${_name}/${_name}-$pkgver-py2.py3-none-any.whl"
)
md5sums=(
  '918cbc06a91d2a420b9d2668f7d9780c'
)

package() {
  # install
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps "${_name}-$pkgver-py2.py3-none-any.whl"
  # generate .pyo
  python -O -m compileall ${pkgdir}
}
