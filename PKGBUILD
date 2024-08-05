pkgname=python-chibi-dl
_pyname=chibi_dl
pkgver=0.1.2
pkgrel=1
pkgdesc="python lib to create scrapers"
arch=('any')
url="https://pypi.org/project/chibi-dl/"
license=('WTFPL')
groups=()
depends=("python-chibi" "python-chibi-requests" "python-selenium" "python-cfscrape" "python")
makedepends=("python-setuptools")
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/${_pyname//-/_}/${_pyname//-/_}-$pkgver.tar.gz")
sha256sums=('fc507a6041a9d1d6766bd8c03a9cc4ec89a8c5f45948a0bf59be0e8ddac9c5c1')

build() {
	cd "$_pyname-$pkgver"
	python setup.py build
}

package() {
	cd $_pyname-${pkgver}
	python setup.py install --root="$pkgdir" --optimize=1
}
