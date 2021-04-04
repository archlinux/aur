# Maintainer: Victor <v1c70rp@gmail.com>

pkgname=mathics-scanner
_pkgname=Mathics_Scanner
pkgver=1.1.1
pkgrel=1
pkgdesc="Mathics' tokeniser or scanner portion for the Wolfram Language."
arch=('any')
url="https://mathics.org/"
license=('GPL3')
depends=('python-chardet' 'python-ujson' 'python-click')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Mathics3/$pkgname/releases/download/$pkgver/$_pkgname-$pkgver.tar.gz")
sha256sums=('8c9a71d960b8b41d2d12dd8d236da48ab8a847b2a1169e75c86307564d172ba8')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
