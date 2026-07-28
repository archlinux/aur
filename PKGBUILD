pkgname=python-chibi-browser
_pyname=chibi_browser
pkgver=1.3.1
pkgrel=1
pkgdesc="Layer to controll seleniium with chibi_site"
arch=('any')
url="https://pypi.org/project/chibi-browser/"
license=('WTFPL')
groups=()
depends=("python-chibi-site" 'python-selenium' 'python-humancursor' 'python-undetected' )
makedepends=("python-setuptools")
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/${_pyname//-/_}/${_pyname//-/_}-$pkgver.tar.gz")
sha256sums=('5230586a226b8e405588943b612e34423ebb3f4ce2a1dfccd7311dfddfa3167a')

build() {
	cd "$_pyname-$pkgver"
	python setup.py build
}

package() {
	cd $_pyname-${pkgver}
	python setup.py install --root="$pkgdir" --optimize=1
}
