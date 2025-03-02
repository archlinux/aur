pkgname=python-chibi-github
_pyname=chibi_github
pkgver=0.1.2
pkgrel=1
pkgdesc="lib to use github api"
arch=('any')
url="https://pypi.org/project/chibi-github/"
license=('WTFPL')
groups=()
depends=("python-chibi-api")
makedepends=("python-setuptools")
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/${_pyname//-/_}/${_pyname//-/_}-$pkgver.tar.gz")
sha256sums=('7d8cf77bd590b24f3377f3c4657901160ed72c0c7c4ad51a39c10c0dc7076f9d')

build() {
	cd "$_pyname-$pkgver"
	python setup.py build
}

package() {
	cd $_pyname-${pkgver}
	python setup.py install --root="$pkgdir" --optimize=1
}
