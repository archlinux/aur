# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_appname="harlequin_odbc"
pkgname="${_appname//_/-}"
pkgver=0.3.1
pkgrel=1
pkgdesc="An ODBC adapter for Harlequin"
url="https://harlequin.sh/"
_github_url="https://github.com/tconbeer/harlequin-postgres"
license=("MIT")
arch=("any")
depends=("harlequin" "python-pyodbc" "unixodbc")
makedepends=("python-build"
             "python-installer"
             "python-poetry"
             "python-wheel")
options=("!strip")
source=("https://files.pythonhosted.org/packages/source/${_appname::1}/${_appname}/${_appname}-${pkgver}.tar.gz")
b2sums=('a3fb93d2fdf2641e2cd8f6cc4109def249ee196df7bb6f3de9e38e9b52ce22453db263673ac367e1d9cf78563c3ca44c2e6763593f7d44f7d1c042b361c77e7d')

build(){
    cd "${_appname}-${pkgver}"

    python -m build --wheel --no-isolation
}

package(){
    cd "${_appname}-${pkgver}"

    python -m installer --destdir="$pkgdir" dist/*.whl
}
