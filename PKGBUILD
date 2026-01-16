_name=pyod
pkgname="python-$_name"
pkgver=2.0.6
pkgrel=1
arch=('any')
pkgdesc="A Python 3 Library Outlier Detection or Anomaly Detection"
url="https://github.com/yzhao062/pyod"
license=('GPL3')
source=("https://github.com/yzhao062/pyod/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('13200a395ccfae8a25fc2b05966e3f193fa26adfcad65336078f1cc75d87827e0cb50f6e1f2e3ec3310cc7e114584c4c4ceaf84c1eae6077cf4e192a215df789')
depends=(
  'python'
  'python-joblib'
  'python-numba'
  'python-numpy'
  'python-packaging'
  'python-scikit-learn'
  'python-scipy'
)
makedepends=('python-setuptools')

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}
