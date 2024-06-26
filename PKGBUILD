# Maintainer: Antonio Bartalesi <antonio.bartalesi@gmail.com>

_name=fisx
pkgname=python-${_name}
pkgver=1.3.2
pkgrel=1
pkgdesc="Quantitative X-Ray Fluorescence Analysis Support Library"
arch=('x86_64')
url='https://github.com/vasole/fisx'
license=('MIT')
depends=(python-numpy)
makedepends=(python-setuptools python-numpy cython)
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('3c818b016b69bb50476bd246ab14cf06e8e3653114c2f2524dce11d6bc070e9a')

build() {
  cd "${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
