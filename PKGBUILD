pkgname=python-chibi-command
_pyname=chibi_command
pkgver=2.4.5
pkgrel=1
pkgdesc="run terminal commands"
arch=('any')
url="https://pypi.org/project/chibi-command/"
license=('WTFPL')
groups=()
depends=("python-chibi" "python-chibi-hybrid" "python-chibi-atlas" "python-chibi-requests")
makedepends=("python-setuptools")
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/${_pyname//-/_}/${_pyname//-/_}-$pkgver.tar.gz")
sha256sums=('63926811d4285c653b29db8207e929605d9fcead32f361bcf2c843101b58deb9')

build() {
	cd "$_pyname-$pkgver"
	python setup.py build
}

package() {
	cd $_pyname-${pkgver}
	python setup.py install --root="$pkgdir" --optimize=1
}
