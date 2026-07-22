pkgname=python-chibi-requests
_pyname=chibi_requests
pkgver=2.1.0
pkgrel=1
pkgdesc="python lib to make more easy use and human requests"
arch=('any')
url="https://pypi.org/project/chibi-requests/"
license=('WTFPL')
groups=()
depends=("python-chibi" "python-requests" "python-beautifulsoup4" "python-marshmallow" "python")
makedepends=("python-setuptools")
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/${_pyname//-/_}/${_pyname//-/_}-$pkgver.tar.gz")
sha256sums=('b65bcb266817aaf6f4f65c0741f520b4cf6242fa5d51529aea8a6c990ae415e4')

build() {
	cd "$_pyname-$pkgver"
	python setup.py build
}

package() {
	cd $_pyname-${pkgver}
	python setup.py install --root="$pkgdir" --optimize=1
}
