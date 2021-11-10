# Maintainer: krasjet

pkgname=pdf.tocgen
pkgver=1.3.0
pkgrel=1
pkgdesc="Automatically generate table of contents for PDF documents."
arch=('any')
url="https://github.com/Krasjet/pdf.tocgen"
license=('GPL3')
depends=('python-toml' 'python-pymupdf')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('ad2cb189c2d23ccf522e46bacbdd022a37dd166deb445e6b4ee7cb12aa1cdc78')

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
