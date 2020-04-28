# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=litex
pkgname=python-$_pkgname
pkgver=2020.04
pkgrel=1
pkgdesc='Migen/MiSoC based Core/SoC builder that provides the infrastructure to easily create Cores/SoCs'
arch=('any')
url='https://github.com/enjoy-digital/litex'
license=('BSD')
depends=('python-migen' 'python-pyserial' 'python-requests' 'python-pythondata-software-compiler_rt')
makedepends=('python-setuptools')
checkdepends=('python-pytest-runner')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('5ac44a14e0c1a122528692312a9a7927b3f2b7a506f02131ac672f35e064bf3d523c731c0e023a023bf2dc37f9396eb96b757b455632e2b2611d2e8fe2c899b3')

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

