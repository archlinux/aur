# Maintainer: dem4ply <dem4ply@gmail.com>

pkgname=python-chibi-donkey
_pyname=chibi_donkey
pkgver=1.0.2
pkgrel=1
pkgdesc="library for proccess the format double undescore"
arch=('any')
url="https://pypi.org/project/chibi_donkey/"
license=('WTFPL')
groups=()
depends=("python")
makedepends=("python-setuptools")
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/${_pyname//-/_}/${_pyname//-/_}-$pkgver.tar.gz")
sha256sums=('39b5c196480119e05432ccfa500225d26ebd910db1725d0b7d9ffd0870142f09')

build() {
	cd "$_pyname-$pkgver"
	python setup.py build
}

package() {
	cd $_pyname-${pkgver}
	python setup.py install --root="$pkgdir" --optimize=1
}
