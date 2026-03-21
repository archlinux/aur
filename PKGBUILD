pkgname=python-chibi-github
_pyname=chibi_github
pkgver=0.3.0
pkgrel=1
pkgdesc="lib to use github api"
arch=('any')
url="https://pypi.org/project/chibi-github/"
license=('WTFPL')
groups=()
depends=("python-chibi-api")
makedepends=("python-setuptools")
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/${_pyname//-/_}/${_pyname//-/_}-$pkgver.tar.gz")
sha256sums=('042c3f21baba63622eb06af8463fa94ac2abf250f057c9f692c79321ace710c5')

build() {
	cd "$_pyname-$pkgver"
	python setup.py build
}

package() {
	cd $_pyname-${pkgver}
	python setup.py install --root="$pkgdir" --optimize=1
}
