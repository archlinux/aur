# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Martino Pilia <martino.pilia@gmail.com>

_pkgname=ANTsPy
pkgname=python-antspy
pkgver=0.2.2
pkgrel=2
_commit=1d4148c0b2e67ba5595f81264a6143c9aa38a839
pkgdesc="Advanced Normalization Tools (ANTs) in Python"
arch=('any')
url="https://github.com/ANTsX/ANTsPy"
license=('apache')
depends=('python' 'python-numpy' 'python-webcolors' 'insight-toolkit')
optdepends=('python-plotly: surface rendering')
makedepends=('python-setuptools')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/ANTsX/ANTsPy/archive/v${pkgver}.tar.gz")
sha512sums=('e3f580a3164c273fd8a1d65227f38806a5cf17c3de1a2beca0c80d3ef8dcc8c52c3d619e38225f429555d89228768a720ce38a03b47e929848d3c2b1ed4c5802')


build() {
	cd "$_pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$_pkgname-$pkgver"
    export ITK_DIR="/usr"
	python setup.py install --optimize=1 --root="${pkgdir}" --skip-build
}
