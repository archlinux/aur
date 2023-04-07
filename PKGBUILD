# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=liteeth
pkgname=python-$_pkgname
pkgver=2021.08
pkgrel=2
pkgdesc='Small footprint and configurable Ethernet core'
arch=('any')
url="https://github.com/enjoy-digital/$_pkgname"
license=('BSD')
depends=('python-migen' 'python-litex')
makedepends=('python-setuptools')
#checkdepends=('python-pytest-runner') # broken env
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('800364f2ba4a264b660e4e563d2bd1b1c3054f6f3dd9916ca7b97b38ecde0b80bd840188415a00a8aa8e34270d8d41c6edf9ed42b5efbb50e25507e609b6b750')

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
