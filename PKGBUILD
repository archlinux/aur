# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=litescope
pkgname=python-$_pkgname
pkgver=2020.08
pkgrel=3
pkgdesc='Small footprint and configurable embedded FPGA logic analyzer core'
arch=('any')
url="https://github.com/enjoy-digital/$_pkgname"
license=('BSD')
depends=('python-migen' 'python-litex')
makedepends=('python-setuptools')
#checkdepends=('python-pytest-runner') # broken env
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('aaac42302af6ac067e2d814a0d0478029828f55bc4d5b0b710f8139c612a3b6631af8b5ad5f026cc00884a99b9f759dcb36a878c96a19c1da938f8760caccd9e')

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
