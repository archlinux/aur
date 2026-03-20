pkgname=python-chibi-command
_pyname=chibi_command
pkgver=2.2.0
pkgrel=2
pkgdesc="run terminal commands"
arch=('any')
url="https://pypi.org/project/chibi-command/"
license=('WTFPL')
groups=()
depends=("python-chibi" "python-chibi-hybrid" "python-chibi-atlas" "python-chibi-requests")
makedepends=("python-setuptools")
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/${_pyname//-/_}/${_pyname//-/_}-$pkgver.tar.gz")
sha256sums=('f1151d44c2ab9ca582781b94ad310c43b7618f4d15d75bd22dd9e7ae6cf7800a')

build() {
	cd "$_pyname-$pkgver"
	python setup.py build
}

package() {
	cd $_pyname-${pkgver}
	python setup.py install --root="$pkgdir" --optimize=1
}
