# Maintainer: Simon Hanna <simon dot hanna AT serve-me DOT info>

pkgname=('python-mailmanclient' 'python2-mailmanclient')
_commit="5d57d74c6145f22692b80de388ab763f6b348008"
pkgver="3.1.0"
pkgrel=1
pkgdesc="Library that provides official Python bindings for the GNU Mailman 3 REST API"
arch=(any)
url="https://gitlab.com/mailman/mailmanclient"
license=('LGPL')
options=(!emptydirs)
source=("mailmanclient-${pkgver}.tar.gz::https://gitlab.com/mailman/mailmanclient/repository/archive.tar.gz?ref=${pkgver}")
sha256sums=('9916b86b02fe3027bc389bb3eee4a489693ddeef287d505a197d82687cafbd1e')
makedepends=('python-setuptools' 'python2-setuptools')

package_python-mailmanclient() {
  depends=('python' 'python-six' 'python-httplib2')
  cd "$srcdir/mailmanclient-$pkgver-$_commit"
  python setup.py install --root="$pkgdir/" --optimize=1
}

package_python2-mailmanclient() {
  depends=('python2' 'python2-six' 'python2-httplib2')
  cd "$srcdir/mailmanclient-$pkgver-$_commit"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
