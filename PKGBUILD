# Maintainer: dem4ply <dem4ply@gmail.com>

pkgname=python-chibi-atlas
_pyname=chibi_atlas
pkgver=1.0.2
pkgrel=1
pkgdesc="small lib to proccess the keys of the dict like attributes"
arch=('any')
url="https://pypi.org/project/chibi_atlas/"
license=('WTFPL')
groups=()
depends=("python" "python-yaml")
makedepends=("python-setuptools")
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/${_pyname//-/_}/${_pyname//-/_}-$pkgver.tar.gz")
sha256sums=('930380c2b9a80a6b236f9a1eec99976a376d7cfd626a5cbbba34789fbb2bf67e')

build() {
	cd "$_pyname-$pkgver"
	python setup.py build
}

package() {
	cd $_pyname-${pkgver}
	python setup.py install --root="$pkgdir" --optimize=1
}

