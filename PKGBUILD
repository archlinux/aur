# Maintainer: robertfoster

pkgname=python-unoserver
pkgver=1.6
pkgrel=1
pkgdesc="Using LibreOffice as a server for converting documents"
arch=('any')
depends=('python')
makedepends=('python-setuptools')
url="https://github.com/unoconv/unoserver"
license=('MIT')
options=(!emptydirs)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/$pkgver.tar.gz")

build() {
  cd ${pkgname##python-}-$pkgver
  python setup.py build
}

package() {
  cd ${pkgname##python-}-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}

sha256sums=('9f27b7e805943097cc29a9e5e53d58acf0d9a447e248150749da456102d01288')
