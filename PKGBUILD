pkgname=python-chibi-command
_pyname=chibi_command
pkgver=2.3.1
pkgrel=1
pkgdesc="run terminal commands"
arch=('any')
url="https://pypi.org/project/chibi-command/"
license=('WTFPL')
groups=()
depends=("python-chibi" "python-chibi-hybrid" "python-chibi-atlas" "python-chibi-requests")
makedepends=("python-setuptools")
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/${_pyname//-/_}/${_pyname//-/_}-$pkgver.tar.gz")
sha256sums=('5f94ef1119837b12c688911596c069e686a0383cd55794f50842aba8449eb6ff')

build() {
	cd "$_pyname-$pkgver"
	python setup.py build
}

package() {
	cd $_pyname-${pkgver}
	python setup.py install --root="$pkgdir" --optimize=1
}
