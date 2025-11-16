# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_appname="harlequin_postgres"
pkgname="${_appname//_/-}"
pkgver=1.3.0
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
b2sums=('631388c60efb408a84b347279d08f1a6ac3d6e13d974451a40bbf2ee6608ad3b4361060d255b3bd83715426e37095fe5a674001f8b5880c5a52abe555de3508b')

build(){
    cd "${_appname}-${pkgver}"

    python -m build --wheel --no-isolation
}

package(){
    cd "${_appname}-${pkgver}"

    python -m installer --destdir="$pkgdir" dist/*.whl
}
