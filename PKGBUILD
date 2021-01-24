# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=litesata
pkgname=python-$_pkgname
pkgver=2020.12
pkgrel=1
pkgdesc='Small footprint and configurable SATA core'
arch=('any')
url="https://github.com/enjoy-digital/$_pkgname"
license=('BSD')
depends=('python-migen' 'python-litex')
makedepends=('python-setuptools')
# checkdepends=('python-pytest-runner') # missing litescope release
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('c09ddf8a0beeb9865dcdeaadcb0e6f49a0a5fa74f320021685e0da49707754cff8ea40a33f46e0c678d988f395f87606054d63de7f3da17196684fb15eb75976')

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
