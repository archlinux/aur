# Maintainer: Michał Pałubicki <maln0ir@gmx.com>

_pkgname=csvkit
pkgname=python-$_pkgname
pkgver=1.0.2
pkgrel=1
pkgdesc="A suite of utilities for converting to and working with CSV."
arch=("any")
url="http://csvkit.readthedocs.org"
license=("MIT")
depends=("python"
         "python-agate"
         "python-agate-dbf"
         "python-agate-excel"
         "python-dateutil"
         "python-six"
         "python-sqlalchemy")
makedepends=("python-setuptools")
source=("https://github.com/wireservice/csvkit/archive/${pkgver}.tar.gz")
sha256sums=("35c8c7c699573bec47cbd3576240cc9b444d35f309386f8030340bc50315cdec")

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}

check() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py test
}
