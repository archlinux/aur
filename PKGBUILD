# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="python-pynisher"
_name="pynisher"
pkgver=1.0.10
pkgrel=1
pkgdesc="A library to limit the resources used by functions using subprocesses"
url="https://github.com/automl/pynisher"
license=("BSD-3")
arch=("any")
depends=("cython"
         "python"
         "python-psutil"
         "python-typing_extensions")
makedepends=("python-build" "python-installer" "python-wheel" "python-setuptools")
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
b2sums=('78ad4d25b8fd312edfe4f8db63cfa0e1a32400274ec3ecb35b24b19e7eaf34bb7aa0fc3401a6762db08ebd2240ccfc5fb9774808d40c2aac35e2f9cba33258f3')
options=("!strip")

build(){
 cd "$_name-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$_name-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
