pkgname=python-deezer
_name=deezer_python
pkgver=7.1.2
pkgrel=1
pkgdesc="Deezer-Python: a friendly wrapper around the Deezer API."
url="https://github.com/browniebroke/deezer-python"
arch=('any')
license=('MIT')
depends=('python' 'python-httpx')
makedepends=('python-setuptools' 'python-build' 'python-installer')

source=("${pkgname//-/_}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_name}-${pkgver}.tar.gz")
sha256sums=('d6e2fd40091294e81b3e4d0de23675a654ee4902a1db31031e03f5965e828fe3')

build() {
	cd "${srcdir}/${_name}-${pkgver}"
	python -m build
}

package() {
	cd "${srcdir}/${_name}-${pkgver}"
	python -m installer --destdir="${pkgdir}" dist/*.whl
}

