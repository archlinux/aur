# Maintainer: Chris Oelmueller <chris.oelmueller@gmail.com>
# Contributor: Sebastien Binet <binet@cern.ch>

pkgname=python2-processing
_name=${pkgname#python2-}
pkgver=0.52
pkgrel=2
pkgdesc="Package for using processes which mimics the threading module"
url="https://pypi.python.org/pypi/processing"
arch=('any')
license=('BSD')
depends=('python2')
source=("https://pypi.python.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.zip")
md5sums=('62772fa3002d003b2395ed669072d51d')

PYTHON='python2'

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  $PYTHON setup.py build
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  $PYTHON setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -D -m 644 COPYING.txt "${pkgdir}/usr/share/licenses/${pkgname}/COPYING.txt"
}
