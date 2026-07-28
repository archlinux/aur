pkgname=python-chibi-requests
_pyname=chibi_requests
pkgver=2.1.1
pkgrel=1
pkgdesc="python lib to make more easy use and human requests"
arch=('any')
url="https://pypi.org/project/chibi-requests/"
license=('WTFPL')
groups=()
depends=("python-chibi" "python-requests" "python-beautifulsoup4" "python-marshmallow" "python")
makedepends=("python-setuptools")
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/${_pyname//-/_}/${_pyname//-/_}-$pkgver.tar.gz")
sha256sums=('79565c279eca68ee8a3cd60a1da2d4436fc9255f4d7bdca931c8ca74968433d3')

build() {
	cd "$_pyname-$pkgver"
	python setup.py build
}

package() {
	cd $_pyname-${pkgver}
	python setup.py install --root="$pkgdir" --optimize=1
}
