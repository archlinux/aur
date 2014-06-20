# Maintainer: lestb <tkhdlstfl dot l plus aur at gmail dot com>
# Contributor: Sebastien Binet <binet@lblbox>
pkgname=python2-lineprofiler
pkgver=1.0b3
pkgrel=1
pkgdesc="Line-by-line profiler."
url="http://pypi.python.org/pypi/line_profiler"
arch=('i686' 'x86_64')
license=('BSD')
depends=( 'python2' )
makedepends=('cython2')
source=(http://pypi.python.org/packages/source/l/line_profiler/line_profiler-$pkgver.tar.gz)
md5sums=('63fc2a757192eb5e577559cfdff5b831')

build() {
  cd "${srcdir}/line_profiler-${pkgver}"
  python2 setup.py build
}

package() {
  license_dir="${pkgdir}/usr/share/licenses/${pkgname}"
  cd "${srcdir}/line_profiler-${pkgver}"
  python2 setup.py install --prefix=/usr --root="${pkgdir}"
  install -d ${license_dir}
  install -m644 LICENSE{,_Python}.txt "${license_dir}"
}
