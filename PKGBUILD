# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="python-hashids"
_name="${pkgname#python-}"
pkgver=1.3.1
pkgrel=1
pkgdesc="Implements the hashids algorithm in python"
arch=(any)
url="https://hashids.org/python/"
license=('MIT')
depends=("python-flit")
makedepends=("python-build" "python-installer" "python-setuptools" "python-wheel")
source=("https://pypi.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz")
b2sums=('5b4b303e014034a04d34b2abe3cf77a2b307822e0592023059759fda142390c56e66038042769474193f9d8c5657d5e9cb5d1cd87b36e931bef0130e3972c862')
options=("!strip")

build(){
 cd "$_name-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$_name-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
