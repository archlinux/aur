pkgname=python-chibi
_pyname=chibi
pkgver=0.21.0
pkgrel=1
pkgdesc="python snippets and other useful things"
arch=('any')
url="https://pypi.org/project/chibi/"
license=('WTFPL')
groups=()
depends=("python-magic" "python-dateutils" "python-xmltodict" "python-yaml" "python-chibi-donkey" "python-chibi-atlas" "python")
makedepends=("python-setuptools")
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/${_pyname//-/_}/${_pyname//-/_}-$pkgver.tar.gz")
sha256sums=('917bc0a8ab1b6f568cf10ce1dd8d8c3039b729202c9b1d3bc19b90591ea63da9')

build() {
	cd "$_pyname-$pkgver"
	python setup.py build
}

package() {
	cd $_pyname-${pkgver}
	python setup.py install --root="$pkgdir" --optimize=1
}
