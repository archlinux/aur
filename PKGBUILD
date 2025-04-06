# Maintainer: loserMcloser <reebydobalina@gmail.com>

pkgname=python-textual-image
_pkgname=textual-image
pkgver=0.8.2
pkgrel=1
pkgdesc="Render images in the terminal with Textual and rich"
arch=('any')
url="https://github.com/lnqs/textual-image"
depends=('python' 'python-rich' 'python-pillow')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("https://github.com/lnqs/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz")

build() {
	cd "${_pkgname}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${_pkgname}-${pkgver}"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
b2sums=('2aeb86aa41ac05955cecc35fc3abbcedde11bc3a627d3502c250001c0cbeeb0e73768ab9a2b3d5f6924fdb92e3542c711f32de761597593b27fe64f27614afa1')
