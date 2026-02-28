pkgname=python-chibi-requests
_pyname=chibi_requests
pkgver=1.4.0
pkgrel=1
pkgdesc="python lib to make more easy use and human requests"
arch=('any')
url="https://pypi.org/project/chibi-requests/"
license=('WTFPL')
groups=()
depends=("python-chibi" "python-requests" "python-beautifulsoup4" "python-marshmallow" "python")
makedepends=("python-setuptools")
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/${_pyname//-/_}/${_pyname//-/_}-$pkgver.tar.gz")
sha256sums=('e9ea47343308ebea242a8549f444348cd9fe89ebfa57a1d3e61c0a7f1f934f9a')

build() {
	cd "$_pyname-$pkgver"
	python setup.py build
}

package() {
	cd $_pyname-${pkgver}
	python setup.py install --root="$pkgdir" --optimize=1
}
