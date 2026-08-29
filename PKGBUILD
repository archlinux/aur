# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_appname="harlequin_mysql"
pkgname="${_appname//_/-}"
pkgver=1.4.0
pkgrel=1
pkgdesc="The MySQL adapter for Harlequin"
url="https://harlequin.sh/"
_github_url="https://github.com/tconbeer/harlequin-mysql"
license=("MIT")
arch=("any")
depends=("harlequin" "python-mysql-connector")
makedepends=("python-build"
             "python-installer"
             "python-poetry"
             "python-wheel")
options=("!strip")
source=("https://files.pythonhosted.org/packages/source/${_appname::1}/${_appname}/${_appname}-${pkgver}.tar.gz")
b2sums=('d3699dc9a7623a3898265c72f4015e79954947701b36dacf4fcabd8998c5ac1f1cf9bdcb5c8e2e5d6affb7a776af9a688da2e36cb49dc4f5915b98dcb05ad96e')

build(){
    cd "${_appname}-${pkgver}"

    python -m build --wheel --no-isolation
}

package(){
    cd "${_appname}-${pkgver}"

    python -m installer --destdir="$pkgdir" dist/*.whl
}
