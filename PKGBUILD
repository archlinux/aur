# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_appname="harlequin_mysql"
pkgname="${_appname//_/-}"
pkgver=1.3.0
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
b2sums=('b255e9d9f70813a42258d3c23e824f45571ed72616cd2f9dea206fbb03af61af4f6b72461d155e4346a8cfb785123803e9020105310de968e96c06fcc03e39b5')

build(){
    cd "${_appname}-${pkgver}"

    python -m build --wheel --no-isolation
}

package(){
    cd "${_appname}-${pkgver}"

    python -m installer --destdir="$pkgdir" dist/*.whl
}
