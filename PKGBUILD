pkgname=python-chibi-argsparser
_pyname=chibi_argsparser
pkgver=1.1.0
pkgrel=1
pkgdesc="wrapper for argsparser to make more human the definition of the parser"
arch=('any')
url="https://pypi.org/project/chibi-argsparser/"
license=('WTFPL')
groups=()
depends=("python-chibi-atlas" "python")
makedepends=("python-setuptools")
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/${_pyname//-/_}/${_pyname//-/_}-$pkgver.tar.gz")
sha256sums=('4edae8bae0c5056534c83af9a2bc5c569ca622e9a656a0a6f5673c6deb608593')

build() {
	cd "$_pyname-$pkgver"
	python setup.py build
}

package() {
	cd $_pyname-${pkgver}
	python setup.py install --root="$pkgdir" --optimize=1
}
