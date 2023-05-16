# Maintainer: Hao Zhang <hao at hao-zhang com>
# Contributor: Rich Li <rich at dranek com>
# Contributor: Samed Beyribey <ras0ir AT eventualis DOT org>
pkgname=python-pyspf
pkgver=2.0.14
pkgrel=3
pkgdesc="Python implementation of the Sender Policy Framework (SPF) protocol"
arch=('any')
url="https://pypi.python.org/pypi/pyspf"
license=('PSF')
depends=('python-dnspython')
makedepends=('python-setuptools')
optdepends=('python-authres: Return RFC 5451 Authentication Results headers')
source=("https://files.pythonhosted.org/packages/d4/dc/5b3838ff90474e21fe0914920c53430f73402e07d6598ea228e61b74963e/pyspf-$pkgver.tar.gz")
sha256sums=('57a7ef01bda090173aafb6af0106251686ed73f03db4e911fcd34c57fc347186')

build() {
  cd "$srcdir/pyspf-$pkgver"
  python setup.py build
}

# The package requires installation before testing...so it won't work here
# check() {
# }
 
package() {
  cd "$srcdir/pyspf-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
# vim:set ts=2 sw=2 et:
