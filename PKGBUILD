# Maintainer: Techcable <Techcable at techcable dot net>
pkgname=python-columnize
pkgver=0.3.11
pkgrel=1
epoch=
pkgdesc="Python module to align a simple (not nested) list in columns."
arch=("any")
url="https://github.com/rocky/pycolumnize"
license=('MIT')
groups=()
depends=()
makedepends=("python-setuptools")
checkdepends=("python-mock" "python-pytest" "python-pytest-cov")
backup=() # Anything we need to backup?
options=()
install=
changelog=
# NOTE: Unfortunately 0.3.11 was released with an incorrect tag as 3.11
#
# TODO: Fix this once (or if) upstream fixes it
wrong_pkgver=3.11
source=("columnize-${pkgver}.tar.gz::https://github.com/rocky/pycolumnize/archive/refs/tags/${wrong_pkgver}.tar.gz")
sha256sums=('dbcb3fc33f93da7d34542e7cd649f513cbe3cae7ad23f797c97499fc4ccba91e')

prepare() {
    true; # Nothing to do I guess
}

build() {
    cd "pycolumnize-$wrong_pkgver"
    python3 ./setup.py build;
}

check() {
    cd "pycolumnize-$wrong_pkgver"
    PYTHONPATH="." pytest test;
}

package() {
    cd "pycolumnize-$wrong_pkgver"
    python setup.py install --root="$pkgdir/" --prefix="/usr"
}
