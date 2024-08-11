pkgname=python-chibi-dl
_pyname=chibi_dl
pkgver=0.2.0
pkgrel=2
pkgdesc="python lib to create scrapers"
arch=('any')
url="https://pypi.org/project/chibi-dl/"
license=('WTFPL')
groups=()
depends=("python-chibi" "python-chibi-requests" "python-selenium" "python")
makedepends=("python-setuptools")
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/${_pyname//-/_}/${_pyname//-/_}-$pkgver.tar.gz")
sha256sums=('b1c2aed40034c84d3e3c6a9f53cef0c9b9d98da6bce1a914f20853bd84fa4ac1')

build() {
	cd "$_pyname-$pkgver"
	python setup.py build
}

package() {
	cd $_pyname-${pkgver}
	python setup.py install --root="$pkgdir" --optimize=1
}
