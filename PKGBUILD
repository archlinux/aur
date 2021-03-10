# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>

pkgname=python2-futures
_pkgname=futures
pkgver=3.3.0
pkgrel=2
pkgdesc="Backport of the concurrent.futures package from Python 3.2"
arch=('any')
url="https://github.com/agronholm/pythonfutures"
license=('BSD')
depends=('python2')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/agronholm/pythonfutures/archive/$pkgver.tar.gz"
         LICENSE)
md5sums=('f27b1e0bd1fb32b2b2c79cb0823f2a2d'
         'dd6708d05936d3f6c4e20ed14c87b5e3')

build() {
  cd "python$_pkgname-$pkgver"
  python2 setup.py build
}

package() {
  cd "python$_pkgname-$pkgver"
  python2 setup.py install --root "$pkgdir" --optimize=1

  install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
