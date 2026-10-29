# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_appname="harlequin_mysql"
pkgname="${_appname//_/-}"
pkgver=1.5.0
pkgrel=3
pkgdesc="The MySQL adapter for Harlequin"
url="https://harlequin.sh/"
_github_url="https://github.com/tconbeer/harlequin-mysql"
license=("MIT")
arch=("any")
depends=("python" "harlequin" "python-mysql-connector")
makedepends=("python-build"
             "python-installer"
             "python-hatchling"
             "python-wheel")
options=("!strip")
source=("https://files.pythonhosted.org/packages/source/${_appname::1}/${_appname}/${_appname}-${pkgver}.tar.gz")
b2sums=('628226c96ccee6472467e7a2e74a5b8b7f2d0316760af8c5a2e829c582863a30372ebe99f377976514288980e38a7241bd128adb46c488748e3d259fbfebbec5')

build(){
    cd "${_appname}-${pkgver}"

    python -m build --wheel --no-isolation
}

package(){
    cd "${_appname}-${pkgver}"

    python -m installer --destdir="$pkgdir" dist/*.whl
}
