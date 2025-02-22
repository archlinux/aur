# Maintainer: redponike <proton (dot) me>

pkgname=python-einx
_pkgname=${pkgname#python-}
pkgver=0.3.0
pkgrel=1
pkgdesc="Universal Tensor Operations in Einstein-Inspired Notation for Python."
arch=('x86_64')
url="https://github.com/fferflo/einx"
license=('MIT')
makedepends=('python-setuptools')
depends=('python-numpy' 'python-sympy' 'python-frozendict')
optdepends=(
  'python-pytorch: PyTorch integration' 
  'python-keras: Keras integration' 
)
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a1adb469a75029866fd6b9606cfba252716ffe52d86d423e5b204fa137c572aa')

build() {
  cd "${_pkgname}-$pkgver"
  python setup.py build
}

package() {
  cd "${_pkgname}-$pkgver"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
