# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_appname="harlequin_postgres"
pkgname="${_appname//_/-}"
pkgver=1.5.0
pkgrel=1
pkgdesc="The Postgres adapter for Harlequin"
url="https://harlequin.sh/"
_github_url="https://github.com/tconbeer/harlequin-postgres"
license=("MIT")
arch=("any")
depends=("harlequin" "python-psycopg-pool")
makedepends=("python-build"
             "python-installer"
             "python-poetry"
             "python-wheel")
options=("!strip")
source=("https://files.pythonhosted.org/packages/source/${_appname::1}/${_appname}/${_appname}-${pkgver}.tar.gz")
b2sums=('43b10770527f9c2b623b1b486b4cb2025b99fc61760a9fbe332c8ad21acb7de6c3033b2f9b737608c92cf025edf9e9a40f8f29b071dade0c65635fed0698b530')

build(){
    cd "${_appname}-${pkgver}"

    python -m build --wheel --no-isolation
}

package(){
    cd "${_appname}-${pkgver}"

    python -m installer --destdir="$pkgdir" dist/*.whl
}
