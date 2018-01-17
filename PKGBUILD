# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=mssql-cli
pkgver=0.9.0
_commit=7ec1d8c27def76c5bd2dde28c70025fd5243059b
pkgrel=1
pkgdesc='A Terminal Client for MySQL with AutoCompletion and Syntax Highlighting'
arch=('any')
url='https://pypi.python.org/pypi/mssql_cli'
license=('BSD')
depends=(
    'python'
    'python-click'
    'python-configobj'
    'python-cryptography'
    'python-prompt_toolkit'
    'python-pygments'
    'python-sqlparse'
    'python-cli_helpers'
    'python-humanize'
    'python-applicationinsights'
)
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://github.com/dbcli/mssql-cli/archive/$_commit/$pkgname-$pkgver.tar.gz")
sha256sums=('8c0265bcb374e0a6abe40df4989b6e37e3e2cb8740da16eb19ce89cf78a16ac3')

build() {
    cd "$srcdir/$pkgname-$_commit"
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname-$_commit"
    python setup.py install -O1 --skip-build --root="$pkgdir"
    install -Dm0644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
