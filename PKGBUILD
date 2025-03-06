pkgname=python-deezer
_name=deezer_python
pkgver=7.1.1
pkgrel=1
pkgdesc="Deezer-Python: a friendly wrapper around the Deezer API."
url="https://github.com/browniebroke/deezer-python"
arch=('any')
license=('MIT')
depends=('python' 'python-httpx')
makedepends=('python-setuptools' 'python-build' 'python-installer')

source=("${pkgname//-/_}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_name}-${pkgver}.tar.gz")
sha256sums=('51d6a9276d230e037fe6eb7a89c66a1c9da952a4f721edacfef1beb90f8af971')

build() {
	cd "${srcdir}/${_name}-${pkgver}"
	python -m build
}

package() {
	cd "${srcdir}/${_name}-${pkgver}"
	python -m installer --destdir="${pkgdir}" dist/*.whl
}

