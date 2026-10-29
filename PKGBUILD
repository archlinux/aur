# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_appname="harlequin_postgres"
pkgname="${_appname//_/-}"
pkgver=1.6.0
pkgrel=2
pkgdesc="The Postgres adapter for Harlequin"
url="https://harlequin.sh/"
_github_url="https://github.com/tconbeer/harlequin-postgres"
license=("MIT")
arch=("any")
depends=("python" "harlequin" "python-psycopg-pool")
makedepends=("python-build"
             "python-installer"
             "python-poetry"
             "python-wheel")
options=("!strip")
source=("https://files.pythonhosted.org/packages/source/${_appname::1}/${_appname}/${_appname}-${pkgver}.tar.gz")
b2sums=('97b9186b528b3f44014767082637a20810cbc873d3b40758072a95256fd1ca03eb36a62d9bb3231d6192fd5aaf9a5cebd6e03aa723cc5f8fae74b3b826e4babe')

build(){
    cd "${_appname}-${pkgver}"

    python -m build --wheel --no-isolation
}

package(){
    cd "${_appname}-${pkgver}"

    python -m installer --destdir="$pkgdir" dist/*.whl
}
