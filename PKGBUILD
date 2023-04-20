# Maintainer: krasjet

pkgname=pdf.tocgen
pkgver=1.3.2
pkgrel=1
pkgdesc="Automatically generate table of contents for PDF documents."
arch=('any')
url="https://github.com/Krasjet/pdf.tocgen"
license=('GPL3')
depends=('python-toml' 'python-pymupdf')
makedepends=('python-build' 'python-installer' 'python-poetry-core' 'python-wheel')
pypkgname=pdf_tocgen
source=("https://files.pythonhosted.org/packages/source/${pypkgname::1}/${pypkgname}/${pypkgname}-${pkgver}.tar.gz")
sha256sums=('b74bfa2c0e13d8bbede5d0e870cd67555222b6222402235a856a4fcd992c03be')

build() {
  cd "$pypkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pypkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
