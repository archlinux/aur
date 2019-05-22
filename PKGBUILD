# Maintainer: Toke Høiland-Jørgensen <toke@toke.dk>

pkgname=python-aiosqlite
_pypi_pkgname=aiosqlite
pkgver=0.10.0
pkgrel=0
pkgdesc="AsyncIO bridge to the standard sqlite3 module for Python 3.5+"
arch=(any)
url="https://github.com/jreese/aiosqlite"
license=('MIT')
makedepends=('python-setuptools')
depends=('python')
source=("https://pypi.io/packages/source/a/${_pypi_pkgname}/${_pypi_pkgname}-${pkgver}.tar.gz")
sha256sums=('ad84fbd7516ca7065d799504fc41d6845c938e5306d1b7dd960caaeda12e22a9')

build() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python setup.py build || return 1
}

package() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python setup.py install --root=${pkgdir} --optimize=1 || return 1
}
