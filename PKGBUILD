# Maintainer: Rich Li <rich at dranek com>
# Contributor: lestb <tkhdlstfl dot l plus aur at gmail dot com>
# Contributor: Sebastien Binet <binet@lblbox>
pkgname=python-lineprofiler
pkgver=1.0
pkgrel=1
pkgdesc="Line-by-line profiler"
url="http://pypi.python.org/pypi/line_profiler"
arch=('i686' 'x86_64')
license=('BSD')
depends=('python-setuptools')
makedepends=('cython')
source=(http://pypi.python.org/packages/source/l/line_profiler/line_profiler-$pkgver.tar.gz)
md5sums=('2f8352acfedf83f701a564583db5e14d')

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
