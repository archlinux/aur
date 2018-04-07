# Maintainer: Michał Pałubicki <maln0ir@gmx.com>

_pkgname=csvkit
pkgname=python-$_pkgname
pkgver=1.0.3
pkgrel=1
pkgdesc="A suite of utilities for converting to and working with CSV."
arch=("any")
url="http://csvkit.readthedocs.org"
license=("MIT")
depends=("python"
         "python-agate"
         "python-agate-dbf"
         "python-agate-excel"
         "python-agate-sql"
         "python-dateutil"
         "python-six"
         "python-sqlalchemy")
makedepends=("python-setuptools")
source=("https://github.com/wireservice/csvkit/archive/${pkgver}.tar.gz")
sha256sums=('4ca64988a648c845ad2f02a19d5736c3a2650a44b1dd8952b97b528c7f3e2a97')

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}

check() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py test
}
