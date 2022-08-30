# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=litesata
pkgname=python-$_pkgname
pkgver=2021.04
pkgrel=1
pkgdesc='Small footprint and configurable SATA core'
arch=('any')
url="https://github.com/enjoy-digital/$_pkgname"
license=('BSD')
depends=('python-migen' 'python-litex')
makedepends=('python-setuptools')
# checkdepends=('python-pytest-runner') # missing litescope release
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('b0afc2f0b067538ad84fbafffa7629d9d835a88b8f9c44af56dd6bae4a254bd372c1c26b1b46716902f67ffafb4bc9b36ad2d98ec9cde8de8fb4fe2ea82b6fcf')

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
