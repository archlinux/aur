# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=litedram
pkgname=python-$_pkgname
pkgver=2020.04
pkgrel=1
pkgdesc='Small footprint and configurable DRAM core'
arch=('any')
url="https://github.com/enjoy-digital/$_pkgname"
license=('BSD')
depends=('python-migen' 'python-litex' 'python-yaml')
makedepends=('python-setuptools')
#checkdepends=('python-pytest-runner' 'python-numpy' 'python-liteiclink') # missing pythondata-cpu-vexriscv release
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('584ab7cbaae580f6231168b77c9b0b3ff99838d01231f52eb1df76f7b55e824d69feea5b3e923297c5c18226479859612b89758d31313f7e34eb920435d93b5e')

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

