pkgname=python-chibi-marshmallow
_pyname=chibi_marshmallow
pkgver=1.0.0
pkgrel=1
pkgdesc="fields and snippets for marshmallow"
arch=('any')
url="https://pypi.org/project/chibi-marshmallow/"
license=('WTFPL')
groups=()
depends=("python-marshmallow")
makedepends=("python-setuptools")
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/${_pyname//-/_}/${_pyname//-/_}-$pkgver.tar.gz")
sha256sums=('a5a74b9f0194cb94af06dbde0935f829c322cda9277e89cad2b7d96436af4418')

build() {
	cd "$_pyname-$pkgver"
	python setup.py build
}

package() {
	cd $_pyname-${pkgver}
	python setup.py install --root="$pkgdir" --optimize=1
}
