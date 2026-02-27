pkgname=python-chibi-github
_pyname=chibi_github
pkgver=0.2.0
pkgrel=1
pkgdesc="lib to use github api"
arch=('any')
url="https://pypi.org/project/chibi-github/"
license=('WTFPL')
groups=()
depends=("python-chibi-api")
makedepends=("python-setuptools")
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/${_pyname//-/_}/${_pyname//-/_}-$pkgver.tar.gz")
sha256sums=('205323cd913760b8d057feec596b39b77665702c928962f3052d351d4cab4263')

build() {
	cd "$_pyname-$pkgver"
	python setup.py build
}

package() {
	cd $_pyname-${pkgver}
	python setup.py install --root="$pkgdir" --optimize=1
}
