# Maintainer: Rich Li <rich at dranek com>
# Contributor: Samed Beyribey <ras0ir AT eventualis DOT org>
pkgname=python-pyspf
pkgver=2.0.11
pkgrel=1
pkgdesc="Python implementation of the Sender Policy Framework (SPF) protocol"
arch=('any')
url="http://pypi.python.org/pypi/pyspf"
license=('PSF')
depends=('python-pydns')
makedepends=('python-setuptools')
optdepends=('python-authres: Return RFC 5451 Authentication Results headers')
source=(http://pypi.python.org/packages/source/p/pyspf/pyspf-$pkgver.tar.gz)
md5sums=('83add3a0d8732bcc28841ceb5da440ba')

# NOTE from the maintainer: 2.0.12 is available, but as of 2015-08-10 is
# completely broken due to using tab-indentation for a few lines. The script
# will not run in Python 3. The indentation is ambiguous, so that I cannot
# correct it myself. I sent an email to pyspf@openspf.org on 2015-08-10 to
# notify them of the issue.
 
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
