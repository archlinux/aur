pkgname=python-chibi
_pyname=chibi
pkgver=0.20.0
pkgrel=1
pkgdesc="python snippets and other useful things"
arch=('any')
url="https://pypi.org/project/chibi/"
license=('WTFPL')
groups=()
depends=("python-magic" "python-dateutils" "python-xmltodict" "python-yaml" "python-chibi-donkey" "python-chibi-atlas" "python")
makedepends=("python-setuptools")
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/${_pyname//-/_}/${_pyname//-/_}-$pkgver.tar.gz")
sha256sums=('b69c45fcf156f1f7abd4293780031239514836ebd7bda92a1726603dcbbe2224')

build() {
	cd "$_pyname-$pkgver"
	python setup.py build
}

package() {
	cd $_pyname-${pkgver}
	python setup.py install --root="$pkgdir" --optimize=1
}
