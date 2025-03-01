pkgname=python-chibi-api
_pyname=chibi_api
pkgver=0.1.0
pkgrel=2
pkgdesc="library for do api rest with python"
arch=('any')
url="https://pypi.org/project/chibi-api/"
license=('WTFPL')
groups=()
depends=("python-chibi-hybrid" "python-chibi-requests")
makedepends=("python-setuptools")
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/${_pyname//-/_}/${_pyname//-/_}-$pkgver.tar.gz")
sha256sums=('c4860b2441354c0937537aaac7b6bef368a1460cb110975cf9f22b5883230564')

build() {
	cd "$_pyname-$pkgver"
	python setup.py build
}

package() {
	cd $_pyname-${pkgver}
	python setup.py install --root="$pkgdir" --optimize=1
}
