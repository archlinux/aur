pkgname=python-chibi
_pyname=chibi
pkgver=0.12.0
pkgrel=1
pkgdesc="python snippets and other useful things"
arch=('any')
url="https://pypi.org/project/chibi/"
license=('WTFPL')
groups=()
depends=("python-magic" "python-dateutils" "python-xmltodict" "python-yaml" "python-pillow" "python-chibi-donkey" "python-chibi-atlas" "python")
makedepends=("python-setuptools")
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/${_pyname//-/_}/${_pyname//-/_}-$pkgver.tar.gz")
sha256sums=('dc8a8f3bd120e5d39b525829591990ef90617580096d61b0db5f3ac4a7f2916e')

build() {
	cd "$_pyname-$pkgver"
	python setup.py build
}

package() {
	cd $_pyname-${pkgver}
	python setup.py install --root="$pkgdir" --optimize=1
}
