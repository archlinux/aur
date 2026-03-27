pkgname=python-chibi-argsparser
_pyname=chibi_argsparser
pkgver=1.0.1
pkgrel=1
pkgdesc="wrapper for argsparser to make more human the definition of the parser"
arch=('any')
url="https://pypi.org/project/chibi-argsparser/"
license=('WTFPL')
groups=()
depends=("python-chibi-atlas" "python")
makedepends=("python-setuptools")
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/${_pyname//-/_}/${_pyname//-/_}-$pkgver.tar.gz")
sha256sums=('595cfe3dbc943e192dbf8a38979cccba0a6fd7e6c2fbd8bd6a263a0633cd1b25')

build() {
	cd "$_pyname-$pkgver"
	python setup.py build
}

package() {
	cd $_pyname-${pkgver}
	python setup.py install --root="$pkgdir" --optimize=1
}
