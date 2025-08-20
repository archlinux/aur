# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_appname="harlequin_mysql"
pkgname="${_appname//_/-}"
pkgver=1.2.0
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
b2sums=('b521635ec67aff7a8861d77ff44255498481a2e3bc69c1c1181fdc47f3490e6f4948fea8e040a52b535a3377d5afe4764f7b95633f571cad12c175ff951a3dc1')

build(){
    cd "${_appname}-${pkgver}"

    python -m build --wheel --no-isolation
}

package(){
    cd "${_appname}-${pkgver}"

    python -m installer --destdir="$pkgdir" dist/*.whl
}
