# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_appname="harlequin_odbc"
pkgname="${_appname//_/-}"
pkgver=0.4.0
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
b2sums=('4f56c09921b09054f64b234fd8806ced767ed2e1fbd7fc1a3257986ecd807af52aebec488da7903d8a7013d1cbf85a0d5f2086303e22b397dc316086f1a49304')

build(){
    cd "${_appname}-${pkgver}"

    python -m build --wheel --no-isolation
}

package(){
    cd "${_appname}-${pkgver}"

    python -m installer --destdir="$pkgdir" dist/*.whl
}
