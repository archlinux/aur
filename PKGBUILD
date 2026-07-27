pkgname=python-chibi-browser
_pyname=chibi_browser
pkgver=1.3.0
pkgrel=1
pkgdesc="Layer to controll seleniium with chibi_site"
arch=('any')
url="https://pypi.org/project/chibi-browser/"
license=('WTFPL')
groups=()
depends=("python-chibi-site" 'python-selenium' 'python-humancursor' 'python-undetected' )
makedepends=("python-setuptools")
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/${_pyname//-/_}/${_pyname//-/_}-$pkgver.tar.gz")
sha256sums=('408a012f36ee344861d3c8d58ea804efc755407de6ede591f722caf2f1043b97')

build() {
	cd "$_pyname-$pkgver"
	python setup.py build
}

package() {
	cd $_pyname-${pkgver}
	python setup.py install --root="$pkgdir" --optimize=1
}
