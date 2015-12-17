# Maintainer: Cedric Girard <girard.cedric@gmail.com>
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>

pkgname=python2-futures22
_pkgname=futures
pkgver=2.2.0
pkgrel=1
pkgdesc="Backport of the concurrent.futures package from Python 3.2, version 2.2.0"
arch=('any')
url="https://github.com/agronholm/pythonfutures"
license=('BSD')
depends=('python2')
provides=('python2-futures')
conflicts=('python2-futures')
source=("http://pypi.python.org/packages/source/f/$_pkgname/$_pkgname-$pkgver.tar.gz"
         LICENSE)
md5sums=('310e446de8609ddb59d0886e35edb534'
         'dd6708d05936d3f6c4e20ed14c87b5e3')

build() {
  cd $_pkgname-$pkgver
  python2 setup.py build
}

package() {
  cd $_pkgname-$pkgver
  python2 setup.py install --root "$pkgdir" --optimize=1

  install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
