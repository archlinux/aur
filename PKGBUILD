# Maintainer: Rich Li <rich at dranek com>
# Contributor: lestb <tkhdlstfl dot l plus aur at gmail dot com>
# Contributor: Sebastien Binet <binet@lblbox>
pkgname=python-lineprofiler
pkgver=2.0
pkgrel=1
pkgdesc="Line-by-line profiler"
url="https://pypi.python.org/pypi/line_profiler"
arch=('i686' 'x86_64')
license=('BSD')
depends=('python-setuptools')
makedepends=('cython')
source=("$pkgname-$pkgver.tar.gz::https://github.com/rkern/line_profiler/archive/$pkgver.tar.gz")
sha256sums=('038569e8b6fb55532ca9c5cfa77a08d2f311fa790ae22d08b7b6dbe66086b316')

build() {
  cd "${srcdir}/line_profiler-${pkgver}"
  python setup.py build
}

# # Doesn't work
# check() {
#   cd "${srcdir}/line_profiler-${pkgver}"
#   python -m unittest discover -v tests
# }

package() {
  cd "${srcdir}/line_profiler-${pkgver}"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1

  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 LICENSE{,_Python}.txt "${pkgdir}/usr/share/licenses/${pkgname}"
}
