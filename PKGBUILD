# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_appname="harlequin_mysql"
pkgname="${_appname//_/-}"
pkgver=1.1.0
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
b2sums=('39fd68fe12fe7e86bf92499d0ee954f5f92e94601fdd70717d0ff700a7c95ace85e9e7a082d9ed5479afed3f8f0526191f8ad00fb619587d029208f5007358de')

build(){
    cd "${_appname}-${pkgver}"

    python -m build --wheel --no-isolation
}

package(){
    cd "${_appname}-${pkgver}"

    python -m installer --destdir="$pkgdir" dist/*.whl
}
