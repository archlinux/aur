pkgname=python-deezer
_name=deezer_python
pkgver=7.2.0
pkgrel=1
pkgdesc="Deezer-Python: a friendly wrapper around the Deezer API."
url="https://github.com/browniebroke/deezer-python"
arch=('any')
license=('MIT')
depends=('python' 'python-httpx')
makedepends=('python-setuptools' 'python-build' 'python-installer')

source=("${pkgname//-/_}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_name}-${pkgver}.tar.gz")
sha256sums=('3d57d4399ea0b075816b93fe7cd86e82e080250f67bdcd230e9431fe85a7cb25')

build() {
	cd "${srcdir}/${_name}-${pkgver}"
	python -m build
}

package() {
	cd "${srcdir}/${_name}-${pkgver}"
	python -m installer --destdir="${pkgdir}" dist/*.whl
}

