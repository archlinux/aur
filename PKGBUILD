# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=liteiclink
pkgname=python-$_pkgname
pkgver=2020.04
pkgrel=1
pkgdesc='Small footprint and configurable Inter-Chip communication cores'
arch=('any')
url="https://github.com/enjoy-digital/$_pkgname"
license=('BSD')
depends=('python-migen' 'python-litex')
makedepends=('python-setuptools')
#checkdepends=('python-pytest-runner') # no litescope release
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('a6bb10b1449a5d3f0b3cd3103fc2195f90ee24c1821336b00d475bceda9186b89e5a727231fcee683d8ad35b3ab63469a3e57a644bc618daa7b8bd064f1337ea')

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

