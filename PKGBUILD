# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: Carter Green <crtrgreen at gmail dot com>
pkgname=mssql-cli
pkgver=1.0
pkgrel=2
pkgdesc="Interactive command line query tool for SQL Server"
arch=(any)
url="https://github.com/dbcli/mssql-cli"
license=('BSD')
depends=(
    'python'
    'python-applicationinsights'
    'python-argparse'
    'python-click'
    'python-cli_helpers'
    'python-configobj'
    'python-future'
    'python-humanize'
    'python-polib'
    'python-prompt_toolkit'
    'python-pygments'
    'python-sqlparse'
)
makedepends=(
    'python-setuptools'
)
source=("https://github.com/dbcli/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('331f2cedc3c2f5ed0e3bd8c1ec41eec4d5f07a3ece0c2a08d6b1f0e811c44f9f')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1
    rm "$pkgdir/usr/bin/mssql-cli.bat"
}
