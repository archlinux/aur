# Maintainer: Rich Li <rich at dranek com>
# Contributor: Samed Beyribey <ras0ir AT eventualis DOT org>
pkgname=python-pyspf
pkgver=2.0.12
# This version is a patched release that is only reflected in the filename; this will likely be removed in the next upstream release?
_fix_pkgver=2.0.12t
pkgrel=1
pkgdesc="Python implementation of the Sender Policy Framework (SPF) protocol"
arch=('any')
url="http://pypi.python.org/pypi/pyspf"
license=('PSF')
depends=('python-pydns')
makedepends=('python-setuptools')
optdepends=('python-authres: Return RFC 5451 Authentication Results headers')
source=(http://pypi.python.org/packages/source/p/pyspf/pyspf-$_fix_pkgver.tar.gz)
md5sums=('c83143ad79074bf8c80235748a8a698f')

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
