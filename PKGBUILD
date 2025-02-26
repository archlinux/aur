pkgname=python-chibi-github
_pyname=chibi_github
pkgver=0.1.1
pkgrel=1
pkgdesc="lib to use github api"
arch=('any')
url="https://pypi.org/project/chibi-github/"
license=('WTFPL')
groups=()
depends=("python-chibi-api")
makedepends=("python-setuptools")
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/${_pyname//-/_}/${_pyname//-/_}-$pkgver.tar.gz")
sha256sums=('958630d3114adac57e9cd16bdf4a4ee70d77187b6e37165ffeb4214de63f27b7')

build() {
	cd "$_pyname-$pkgver"
	python setup.py build
}

package() {
	cd $_pyname-${pkgver}
	python setup.py install --root="$pkgdir" --optimize=1
}
