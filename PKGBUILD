# Maintainer: loserMcloser <reebydobalina@gmail.com>

pkgname=python-rich-pixels
_pkgname=rich-pixels
pkgver=3.0.1
pkgrel=2
pkgdesc="A Rich-compatible module for writing pixel images and other colourful grids to the terminal."
arch=('any')
url="https://github.com/darrenburns/rich-pixels"
depends=('python' 'python-rich' 'python-pillow')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
source=("https://github.com/darrenburns/rich-pixels/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('3047b032824876f09bc7078ed02ecd6d81f60918b338622db83972f4214817a5')

build() {
	cd "${_pkgname}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${_pkgname}-${pkgver}"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
