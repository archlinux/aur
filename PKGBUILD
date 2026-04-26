pkgname=python-chibi-argsparser
_pyname=chibi_argsparser
pkgver=1.1.1
pkgrel=1
pkgdesc="wrapper for argsparser to make more human the definition of the parser"
arch=('any')
url="https://pypi.org/project/chibi-argsparser/"
license=('WTFPL')
groups=()
depends=("python-chibi-atlas" "python")
makedepends=("python-setuptools")
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/${_pyname//-/_}/${_pyname//-/_}-$pkgver.tar.gz")
sha256sums=('2332fa95790275dfa5e2f78172fd5a818c6129e8c173b1923ad8aa135e156a1a')

build() {
	cd "$_pyname-$pkgver"
	python setup.py build
}

package() {
	cd $_pyname-${pkgver}
	python setup.py install --root="$pkgdir" --optimize=1
}
