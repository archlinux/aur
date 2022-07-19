_name=pyod
pkgname="python-$_name"
pkgver=1.0.3
pkgrel=1
arch=('any')
pkgdesc="A Python 3 Library Outlier Detection or Anomaly Detection"
url="https://github.com/yzhao062/pyod"
license=('GPL3')
source=("https://github.com/yzhao062/pyod/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('9f6145a4715c7aab165e61a3871c0c6ef73e16ae3492cecb4904c86fd754533c6658538dfca3bcbc123710c0626a2230c70531ad073026c4f195ea9f1d99a165')
depends=(
  'python'
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
