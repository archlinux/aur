# Maintainer: Victor <v1c70rp@gmail.com>

pkgname=mathics-scanner
_pkgname=Mathics_Scanner
pkgver=1.3.1
pkgrel=1
pkgdesc="Mathics' tokeniser or scanner portion for the Wolfram Language."
arch=('any')
url="https://mathics.org/"
license=('GPL3')
depends=('python-chardet' 'python-pyaml' 'python-click')
makedepends=('python-setuptools')
optdepends=('python-ujson: faster than the native json library, but not supported in pyston')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Mathics3/$pkgname/releases/download/$pkgver/$_pkgname-$pkgver.tar.gz")
sha256sums=('599a1e5bb84a802de424256b008ca93365bd73471d0aab5ae99f69028088df22')

build() {
  cd "${srcdir}/${pkgname//-/_}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname//-/_}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
