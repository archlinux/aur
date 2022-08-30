# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=litesdcard
pkgname=python-$_pkgname
pkgver=2021.04
pkgrel=1
pkgdesc='Small footprint and configurable SD Card core'
arch=('any')
url="https://github.com/enjoy-digital/$_pkgname"
license=('BSD')
depends=('python-migen' 'python-litex')
makedepends=('python-setuptools')
#checkdepends=('python-pytest-runner') # broken env
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('ef239d0e7d0b0f86db42c61307d4c611afe1bb3593453101adc367e8a64bbe233b966cb6b865c116036005c54bb81e8890e2a412a4930abe96dd878240755457')

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
