# Maintainer: Greg Fitzgerald <gregf@hugops.pw>

pkgname=python-pocket
pkgver=0.3.6
pkgrel=1
pkgdesc="api wrapper for getpocket.com"
url="https://github.com/tapanpandita/pocket/"
license=('MIT')
arch=('any')
depends=('python')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/57/b6/cd79a0e237e733e2f8a196f4e9f4d30d99c769b809c5fbbea9e34400655d/pocket-${pkgver}.tar.gz")
sha512sums=('7cee6a5e0c5840cae136b264ba9404cdb9b17dbcc0b4051c55cb1e1e1ca3e014862081de5fe7bd687f5d4901f7e456d812091120325c3b5a5c5aeda8978da573')

build() {
  cd "$srcdir/pocket-${pkgver}"
  python setup.py build
}

package() {
  cd "$srcdir/pocket-${pkgver}/"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim: ts=2 sts=2 sw=2 et ft=sh
