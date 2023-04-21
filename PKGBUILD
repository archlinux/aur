# Maintainer: krasjet

pkgname=pdf.tocgen
pkgver=1.3.3
pkgrel=1
pkgdesc="Automatically generate table of contents for PDF documents."
arch=('any')
url="https://github.com/Krasjet/pdf.tocgen"
license=('GPL3')
depends=('python-toml' 'python-pymupdf' 'python-chardet')
makedepends=('python-build' 'python-installer' 'python-poetry-core' 'python-wheel')
pypkgname=pdf_tocgen
source=("https://files.pythonhosted.org/packages/source/${pypkgname::1}/${pypkgname}/${pypkgname}-${pkgver}.tar.gz")
sha256sums=('a48478133cff71f02f81660a306d2c419e28d6a05a85d8f2a418055675a7dd37')

build() {
  cd "$pypkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pypkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
