# Maintainer: krasjet

pkgname=pdf.tocgen
pkgver=1.3.4
pkgrel=1
pkgdesc="Automatically generate table of contents for PDF documents."
arch=('any')
url="https://github.com/Krasjet/pdf.tocgen"
license=('GPL3')
depends=('python-toml' 'python-pymupdf' 'python-chardet')
makedepends=('python-build' 'python-installer' 'python-poetry-core' 'python-wheel')
pypkgname=pdf_tocgen
source=("https://files.pythonhosted.org/packages/source/${pypkgname::1}/${pypkgname}/${pypkgname}-${pkgver}.tar.gz")
sha256sums=('090758832614727eaf1fd0ba0075d5a10eb8f268d1d534fabd7131170a8ac79e')

build() {
  cd "$pypkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pypkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
