# Maintainer: krasjet

pkgname=pdf.tocgen
pkgver=1.2.3
pkgrel=1
pkgdesc="Automatically generate table of contents for PDF documents."
arch=('any')
url="https://github.com/Krasjet/pdf.tocgen"
license=('GPL3')
depends=('python-toml' 'python-pymupdf')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('1f67db98491006b3d6d800dc43bc6a496dfff11958027a0f1d0c840c8744e5ef')

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
