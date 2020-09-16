# Maintainer: Anton Kudelin <kudelin at protonmail dot com>
# Contributor: Sebastiaan Lokhorst <sebastiaanlokhorst@gmail.com>
# Contributor: M0Rf30
# Contributor: Gour <gour@gour-nitai.com>

_pkgname=vatnumber
pkgname=python-$_pkgname
pkgver=1.2
pkgrel=3
pkgdesc="Python module to validate VAT numbers"
arch=('any')
url="https://code.google.com/archive/p/vatnumber"
license=('GPL3')
depends=('python-stdnum')
makedepends=('python-setuptools')
optdepends=("python-suds: SOAP client for European Union's Vat information exchange service")
source=("https://files.pythonhosted.org/packages/d7/7c/869b59cd9cb6ed1057372cb704a3b86688ae8c12cfc7fcaedbc1424f5e7f/$_pkgname-$pkgver.tar.gz")
sha256sums=('4e9e9cabcff6076d8deb8a347edfd5d0ab8cab1ed344fdbe5dd4a6110a2f2c7b')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir" -O1 --skip-build
}
