_name=pyod
pkgname="python-$_name"
pkgver=0.8.3
pkgrel=1
arch=('any')
pkgdesc="A Python 3 Library Outlier Detection or Anomaly Detection"
url="https://github.com/yzhao062/pyod"
license=('GPL3')
source=("https://github.com/yzhao062/pyod/archive/V$pkgver.tar.gz")
sha512sums=('486a491ae50ae0acdc9eabba319c101f871534913c7ea518a0bacf7589e8ebaabaf795d4dfeec025cbabeabc23dc9a11aff1c0c58bf4fed5d7b93b9d0bfe0e6b')
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
