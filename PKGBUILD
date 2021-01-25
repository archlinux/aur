# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=python-wasabi
pkgver=0.8.1
pkgrel=1
pkgdesc="Lightweight console printing and formatting toolkit"
url="https://pypi.org/project/wasabi/"
depends=(python)
makedepends=(python-setuptools)
license=(MIT)
arch=(any)
source=("https://files.pythonhosted.org/packages/af/f8/61b87e7f842aae9d27b3f78554705ccfca2f689c41c689d53f5208892c4b/wasabi-0.8.1.tar.gz")
sha256sums=('6e5228a51f5550844ef5080e74759e7ecb6e344241989d018686ba968f0b4f5a')

build() {
	cd "wasabi-${pkgver}"
	python setup.py build
}

package() {
	cd "wasabi-${pkgver}"
	python setup.py install --skip-build --root="${pkgdir}" --optimize=1
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/python-wasabi/LICENSE"
}
