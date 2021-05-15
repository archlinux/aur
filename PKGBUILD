# Maintainer: Victor <v1c70rp@gmail.com>

pkgname=mathics-scanner
_pkgname=Mathics_Scanner
pkgver=1.2.0
pkgrel=1
pkgdesc="Mathics' tokeniser or scanner portion for the Wolfram Language."
arch=('any')
url="https://mathics.org/"
license=('GPL3')
depends=('python-chardet' 'python-ujson' 'python-click')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Mathics3/$pkgname/releases/download/$pkgver/$_pkgname-$pkgver.tar.gz")
sha256sums=('b40c2144adb12654df600e4464cf8db6584572854476198c0d1fec3cf887f283')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
