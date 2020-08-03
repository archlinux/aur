# Maintainer: krasjet

pkgname=pdf.tocgen
pkgver=1.1.1
pkgrel=1
pkgdesc="A CLI toolset for generating table of contents for PDF documents."
arch=('any')
url="https://github.com/Krasjet/pdf.tocgen"
license=('GPL3')
depends=('python-toml' 'python-pymupdf')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('aa05d985d6c5950ac5303496ef3b6129289bb89e663c69da353a56192e9757d2')

build() {
	cd "$pkgname-$pkgver"
  python setup.py build
}

package() {
	cd "$pkgname-$pkgver"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
