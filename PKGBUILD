# Maintainer: Dringsim <dringsim@qq.com>

pkgname=python-iclips
_name=iCLIPS
pkgver=0.2.3
pkgrel=1
pkgdesc="CLIPS Jupyter console"
arch=('any')
url="https://github.com/noxdafox/iclips"
license=('GPL3')
makedepends=('python-setuptools')
depends=('jupyter-console' 'python-clipspy' 'python-regex')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('793b19da99071ee4b02180d1089168adb45ec23b9fc7076f7a6809201af315ec')

build() {
    cd "$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}