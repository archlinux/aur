# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="python-baikal"
_name="${pkgname/python-/}"
pkgver=0.4.2
pkgrel=1
pkgdesc="A graph-based functional API for building complex scikit-learn pipelines"
url="https://github.com/alegonz/baikal"
license=("BSD-3")
arch=("any")
depends=("python"
         "python-numpy"
         "python-pydot")
makedepends=("python-build" "python-installer" "python-wheel" "python-setuptools")
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
b2sums=('01237b6f612d0daee76b913636f32b2275e91d5bb675e986e95c1ee0a334e93267fc8f150476996f6865cfd8fafcb11ee490b777d1acce1eb77a2c8a5a24e996')

build(){
 cd "$_name-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$_name-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
