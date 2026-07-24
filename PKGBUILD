pkgname=python-chibi-command
_pyname=chibi_command
pkgver=2.6.0
pkgrel=1
pkgdesc="run terminal commands"
arch=('any')
url="https://pypi.org/project/chibi-command/"
license=('WTFPL')
groups=()
depends=("python-chibi" "python-chibi-hybrid" "python-chibi-atlas" "python-chibi-requests")
makedepends=("python-setuptools")
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/${_pyname//-/_}/${_pyname//-/_}-$pkgver.tar.gz")
sha256sums=('c6435519fb92846df15280cd91fba8e1cb9a2acff0eda07b2ede38552022b675')

build() {
	cd "$_pyname-$pkgver"
	python setup.py build
}

package() {
	cd $_pyname-${pkgver}
	python setup.py install --root="$pkgdir" --optimize=1
}
