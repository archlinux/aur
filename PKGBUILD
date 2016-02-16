# Maintainer: Simon Hanna <simon dot hanna AT serve-me DOT info>

pkgname=('python-mailmanclient' 'python2-mailmanclient')
_commit=649da3faa742fad9f4802df4d12daa78517db30f
pkgver=1.0.1
pkgrel=1
pkgdesc="Library that provides official Python bindings for the GNU Mailman 3 REST API"
arch=(any)
url="https://gitlab.com/mailman/mailmanclient"
license=('LGPL')
options=(!emptydirs)
source=("${_pkgbase}-${pkgver}.tar.gz::https://gitlab.com/mailman/mailmanclient/repository/archive.tar.gz?ref=${pkgver}")
sha256sums=('71bc240347a50dc1b547c6cf21c5f4763b35c074b1f3900fb144c07edc267185')
makedepends=('python-setuptools' 'python2-setuptools')

package_python-mailmanclient() {
  depends=('python')
  cd "$srcdir/mailmanclient-$pkgver-$_commit"
  python setup.py install --root="$pkgdir/" --optimize=1
}

package_python2-mailmanclient() {
  depends=('python2')
  cd "$srcdir/mailmanclient-$pkgver-$_commit"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
