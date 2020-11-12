# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=litex-boards
pkgname=python-$_pkgname
pkgver=2020.04
pkgrel=2
pkgdesc='Small footprint and configurable Ethernet core'
arch=('any')
url="https://github.com/litex-hub/$_pkgname"
license=('BSD')
depends=('python-migen' 'python-litex' 'python-litedram' 'python-liteeth' 'python-liteiclink' 'python-litejesd204b'
         'python-litepcie' 'python-litesata' 'python-litescope' 'python-litesdcard' 'python-litevideo')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('548e414c37ca264134bdec1652da4abf6096999f07676a8ffe16693e9f4d85bca072a813bd182ac848fbf8008585c73df208a54a213003c04212946e3aca9354')

build() {
  cd $_pkgname-$pkgver

  python setup.py build
}

package() {
  cd $_pkgname-$pkgver

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
