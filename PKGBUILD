# Maintainer: Michał Pałubicki <maln0ir@gmx.com>

pkgname=csvkit
pkgver=1.0.3
pkgrel=2
pkgdesc="A suite of utilities for converting to and working with CSV."
arch=("any")
url="http://csvkit.readthedocs.org"
license=("MIT")
depends=(
    'python'
    'python-agate>=1.5.5'
    'python-agate-dbf>=0.2.0'
    'python-agate-excel>=0.2.2'
    'python-agate-sql>=0.5.2'
    'python-babel'
    'python-dateutil'
    'python-openpyxl'
    'python-six>=1.6.1'
    'python-sqlalchemy'
    'python-xlrd'
  )
optdepends=(
    'ipython: nicer command-line for csvpy utility'
  )
makedepends=("python-setuptools")
source=("https://github.com/wireservice/csvkit/archive/${pkgver}.tar.gz")
sha256sums=('4ca64988a648c845ad2f02a19d5736c3a2650a44b1dd8952b97b528c7f3e2a97')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}

check() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py test
}

# vim:set ts=2 sw=2 et:
