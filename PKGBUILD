pkgname=python-chibi-requests
_pyname=chibi_requests
pkgver=1.5.0
pkgrel=1
pkgdesc="python lib to make more easy use and human requests"
arch=('any')
url="https://pypi.org/project/chibi-requests/"
license=('WTFPL')
groups=()
depends=("python-chibi" "python-requests" "python-beautifulsoup4" "python-marshmallow" "python")
makedepends=("python-setuptools")
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/${_pyname//-/_}/${_pyname//-/_}-$pkgver.tar.gz")
sha256sums=('eddcd5b5fc1221fbf6bb4d07b692d13d3c61b7c636d257a46e4265b81f60a13a')

build() {
	cd "$_pyname-$pkgver"
	python setup.py build
}

package() {
	cd $_pyname-${pkgver}
	python setup.py install --root="$pkgdir" --optimize=1
}
