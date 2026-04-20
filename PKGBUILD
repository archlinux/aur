# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_appname="harlequin_postgres"
pkgname="${_appname//_/-}"
pkgver=1.3.1
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
b2sums=('45dc805c9c412c5fce8c89a5568eb6f5d56d2db5d64cb558471cbbbf2a178166be923c1e52a7359233855462231dc7fd243232fb0f36a9d467753aa1df94751c')

build(){
    cd "${_appname}-${pkgver}"

    python -m build --wheel --no-isolation
}

package(){
    cd "${_appname}-${pkgver}"

    python -m installer --destdir="$pkgdir" dist/*.whl
}
