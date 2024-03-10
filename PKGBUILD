_name=pyod
pkgname="python-$_name"
pkgver=1.1.3
pkgrel=1
arch=('any')
pkgdesc="A Python 3 Library Outlier Detection or Anomaly Detection"
url="https://github.com/yzhao062/pyod"
license=('GPL3')
source=("https://github.com/yzhao062/pyod/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('ec355d8e9b9386faeecb742ec8516ad8c31b9ff2607e5d20c21a8b33ba5b4a6e7ef637e8c6e1b54bd36d58721899d795ef8ba98406f17ba3f2a62ca4676bdddc')
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
