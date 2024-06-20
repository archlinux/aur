# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="python-pyrfr"
_name="pyrfr"
pkgver=0.9.0
pkgrel=1
pkgdesc="A extensible C++ library for random forests with Python bindings"
url="https://github.com/automl/random_forest_run"
license=("BSD-3")
arch=("any")
depends=("python")
makedepends=("python-build" "python-installer" "python-wheel" "python-setuptools" "doxygen" "swig")
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
b2sums=('ecb73354010acb65bd26918fb5b6bf5ed8c9008a020ccbe51f4cff6dfbff61f21a4da5caf8c512002380dcda37c69aa14ff354e0e4519431b8bc869b6542472a')
options=("!strip")

build(){
 cd "$_name-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$_name-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
