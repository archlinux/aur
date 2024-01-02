# Maintainer: loserMcloser <reebydobalina@gmail.com>

pkgname=python-rich-pixels
_pkgname=rich-pixels
pkgver=2.2.0
pkgrel=1
pkgdesc="A Rich-compatible module for writing pixel images and other colourful grids to the terminal."
arch=('any')
url="https://github.com/darrenburns/rich-pixels"
depends=('python' 'python-rich' 'python-pillow')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-poetry-core')
source=("https://github.com/darrenburns/rich-pixels/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('ed45a3d9cf9e0a3cfb7a1609bf179b3f921436d2dcc9b99e47cd6d450d911b32')

build() {
	cd "${_pkgname}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${_pkgname}-${pkgver}"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
