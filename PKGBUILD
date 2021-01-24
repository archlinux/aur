# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=liteiclink
pkgname=python-$_pkgname
pkgver=2020.12
pkgrel=1
pkgdesc='Small footprint and configurable Inter-Chip communication cores'
arch=('any')
url="https://github.com/enjoy-digital/$_pkgname"
license=('BSD')
depends=('python-migen' 'python-litex')
makedepends=('python-setuptools')
#checkdepends=('python-pytest-runner') # no litescope release
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('dd1ce37f1b9b24c3bd30ef6869c33062b002b7994a8a2c839ed370a9ba7564d9836b4ebb4743cb314fc531d2e5edd624904143a4352e098fc048b9b9d4b20cbd')

build() {
  cd $_pkgname-$pkgver

  python setup.py build
}

check() {
  cd $_pkgname-$pkgver

#  python setup.py pytest
}

package() {
  cd $_pkgname-$pkgver

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
