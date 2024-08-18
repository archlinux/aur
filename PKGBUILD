pkgname=python-chibi-dl
_pyname=chibi_dl
pkgver=0.2.1
pkgrel=2
pkgdesc="python lib to create scrapers"
arch=('any')
url="https://pypi.org/project/chibi-dl/"
license=('WTFPL')
groups=()
depends=("python-chibi" "python-chibi-requests" "python-selenium" "python")
makedepends=("python-setuptools")
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/${_pyname//-/_}/${_pyname//-/_}-$pkgver.tar.gz")
sha256sums=('303ede73ac273bd664785b983783910daf8ff9e0d18300bbbbc516d0e5121a35')

build() {
	cd "$_pyname-$pkgver"
	python setup.py build
}

package() {
	cd $_pyname-${pkgver}
	python setup.py install --root="$pkgdir" --optimize=1
}
