# Maintainer: Simon Hanna <simon dot hanna AT serve-me DOT info>

pkgname=('python-mailmanclient' 'python2-mailmanclient')
_pkgbase='mailmanclient'
_commit=2043f12a31ee2da3e2e85fdf45ff13f92135296b
pkgver=1.0.0
pkgrel=1
pkgdesc="Library that provides official Python bindings for the GNU Mailman 3 REST API"
arch=(any)
url="https://gitlab.com/mailman/mailmanclient"
license=('LGPL')
options=(!emptydirs)
install=
source=("${_pkgbase}-${pkgver}.tar.gz::https://gitlab.com/mailman/mailmanclient/repository/archive.tar.gz?ref=${pkgver}")
sha256sums=('d02b6477c4a7fa5f5a378a696ed51f4122eb9196b9384dca0ee52d612a4d77b7')

package_python-mailmanclient() {
  depends=('python')
  cd "$srcdir/$_pkgbase-$pkgver-$_commit"
  python setup.py install --root="$pkgdir/" --optimize=1
}

package_python2-mailmanclient() {
  depends=('python2')
  cd "$srcdir/$_pkgbase-$pkgver-$_commit"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
