# Maintainer: zoe <chp321 [at] gmail [dot] com>

pkgname=pdfcropmargins
pkgver=2.2.1
pkgrel=1
pkgdesc="Automatically crops the margins of PDF files"
url="https://pypi.org/project/pdfCropMargins/"
arch=('any')
license=('GPL')
makedepends=('python-build' 'python-installer' 'python-wheel')
depends=('python-pymupdf' 'python-pypdf')
optdepends=('ghostscript' 'poppler')
conflicts=('python-pysimplegui')
install=${pkgname}.install
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname//-/_}/${pkgname//-/_}-$pkgver.tar.gz")
sha512sums=('aa5f250d9e82bc28bfa99aecfa2ba36cca5f66b5eeb272ad661fab093bf9393e84213a4bee9f3fa6e06655d7eea94e28d1b2030f3d79a414a9925cc25336487f')

build() {
    cd $pkgname-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
