# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_appname="harlequin_postgres"
pkgname="${_appname//_/-}"
pkgver=1.4.0
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
b2sums=('597f4832f5cd5d95c9f8606882e25435ebbac2823d671fff4be1754d760e93aac653d7af9b2ef6f648ffe960697fba7023411a7872d4a70b0bd9a070bbc1a132')

build(){
    cd "${_appname}-${pkgver}"

    python -m build --wheel --no-isolation
}

package(){
    cd "${_appname}-${pkgver}"

    python -m installer --destdir="$pkgdir" dist/*.whl
}
