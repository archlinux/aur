# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=litedram
pkgname=python-$_pkgname
pkgver=2021.04
pkgrel=1
pkgdesc='Small footprint and configurable DRAM core'
arch=('any')
url="https://github.com/enjoy-digital/$_pkgname"
license=('BSD')
depends=('python-migen' 'python-litex' 'python-yaml')
makedepends=('python-setuptools')
#checkdepends=('python-pytest-runner' 'python-numpy' 'python-liteiclink') # missing pythondata-cpu-vexriscv release
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('b73f01793558f90fd8e8043c43ce9e307190b63b7a47866fc39415b0c53fd54ed51a3ca33c2ad0d1b61b82c89651adf1bb3987ae4bea53cf9070a70425c3d3fd')

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
