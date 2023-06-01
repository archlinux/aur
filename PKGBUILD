# Maintainer: loserMcloser <reebydobalina@gmail.com>

pkgname=python-rich-pixels
_pkgname=rich-pixels
pkgver=2.1.1
pkgrel=1
pkgdesc="A Rich-compatible module for writing pixel images and other colourful grids to the terminal."
arch=('any')
url="https://github.com/darrenburns/rich-pixels"
depends=('python' 'python-rich' 'python-pillow')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-poetry-core')
source=("https://github.com/darrenburns/rich-pixels/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('af7dd45d6c1a4c3a637c7f202db9fc90378c437dda86a3cd01ffb510032b8bf7')

build() {
	cd "${_pkgname}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${_pkgname}-${pkgver}"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
