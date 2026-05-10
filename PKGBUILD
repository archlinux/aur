pkgname=python-chibi-requests
_pyname=chibi_requests
pkgver=2.0.0
pkgrel=1
pkgdesc="python lib to make more easy use and human requests"
arch=('any')
url="https://pypi.org/project/chibi-requests/"
license=('WTFPL')
groups=()
depends=("python-chibi" "python-requests" "python-beautifulsoup4" "python-marshmallow" "python")
makedepends=("python-setuptools")
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/${_pyname//-/_}/${_pyname//-/_}-$pkgver.tar.gz")
sha256sums=('3299803e83285a1989f4fb2806d06ee8e23f3cf8403cd328e7d93eee9397c1cb')

build() {
	cd "$_pyname-$pkgver"
	python setup.py build
}

package() {
	cd $_pyname-${pkgver}
	python setup.py install --root="$pkgdir" --optimize=1
}
