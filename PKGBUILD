pkgname=python-chibi
_pyname=chibi
pkgver=0.18.0
pkgrel=1
pkgdesc="python snippets and other useful things"
arch=('any')
url="https://pypi.org/project/chibi/"
license=('WTFPL')
groups=()
depends=("python-magic" "python-dateutils" "python-xmltodict" "python-yaml" "python-chibi-donkey" "python-chibi-atlas" "python")
makedepends=("python-setuptools")
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/${_pyname//-/_}/${_pyname//-/_}-$pkgver.tar.gz")
sha256sums=('f21b42c9d23647221b818066f5789b486963d929df623795a31a5aab32b36454')

build() {
	cd "$_pyname-$pkgver"
	python setup.py build
}

package() {
	cd $_pyname-${pkgver}
	python setup.py install --root="$pkgdir" --optimize=1
}
