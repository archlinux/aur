# Maintainer: Victor <v1c70rp@gmail.com>

pkgname=mathics-scanner
_pkgname=Mathics_Scanner
pkgver=1.1.2
pkgrel=1
pkgdesc="Mathics' tokeniser or scanner portion for the Wolfram Language."
arch=('any')
url="https://mathics.org/"
license=('GPL3')
depends=('python-chardet' 'python-ujson' 'python-click')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Mathics3/$pkgname/releases/download/$pkgver/$_pkgname-$pkgver.tar.gz")
sha256sums=('54d300e00489d6fc6871d6f456eecbe125a92f859d99c17587b3921b1db976d9')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
