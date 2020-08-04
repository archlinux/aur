# Maintainer: krasjet

pkgname=pdf.tocgen
pkgver=1.1.3
pkgrel=1
pkgdesc="Automatically generate table of contents for PDF documents."
arch=('any')
url="https://github.com/Krasjet/pdf.tocgen"
license=('GPL3')
depends=('python-toml' 'python-pymupdf')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('d1ef60a0b82d0250f98b76bcc89b19beb7c92d76df484b341aa0fc302782b242')

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
