# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=litescope
pkgname=python-$_pkgname
pkgver=2020.04
pkgrel=1
pkgdesc='Small footprint and configurable embedded FPGA logic analyzer core'
arch=('any')
url="https://github.com/enjoy-digital/$_pkgname"
license=('BSD')
depends=('python-migen' 'python-litex')
makedepends=('python-setuptools')
#checkdepends=('python-pytest-runner') # broken env
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('ae3eea931e14e4d53bd10cea681093c77de50daa4b96c35fd8269a798b41c112e6937536d2f501db72ac87f6ca818fab4865543341a5b5dd41e83936e7f4d158')

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

