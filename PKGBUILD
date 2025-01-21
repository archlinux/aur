pkgname=python-chibi-hybrid
_pyname=chibi_hybrid
pkgver=1.2.1
pkgrel=2
pkgdesc="simple class for have hybrid class and instance methods and add class properties"
arch=('any')
url="https://pypi.org/project/chibi-hybrid/"
license=('WTFPL')
groups=()
depends=("python")
makedepends=("python-setuptools")
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/${_pyname//-/_}/${_pyname//-/_}-$pkgver.tar.gz")
sha256sums=('9ec3a1c0b3ee0c3b8ab9940b251bd7ae57e8311d463abd4f71dbc6d85e0c2a71')

build() {
	cd "$_pyname-$pkgver"
	python setup.py build
}

package() {
	cd $_pyname-${pkgver}
	python setup.py install --root="$pkgdir" --optimize=1
}
