pkgname=python-chibi-command
_pyname=chibi_command
pkgver=2.5.0
pkgrel=1
pkgdesc="run terminal commands"
arch=('any')
url="https://pypi.org/project/chibi-command/"
license=('WTFPL')
groups=()
depends=("python-chibi" "python-chibi-hybrid" "python-chibi-atlas" "python-chibi-requests")
makedepends=("python-setuptools")
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/${_pyname//-/_}/${_pyname//-/_}-$pkgver.tar.gz")
sha256sums=('ec351a457e72aec941fb8d9eac522a9ca7cd0fec342a66fa6c6a3cfdda0ed627')

build() {
	cd "$_pyname-$pkgver"
	python setup.py build
}

package() {
	cd $_pyname-${pkgver}
	python setup.py install --root="$pkgdir" --optimize=1
}
