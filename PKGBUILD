# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-asynctest
pkgver=0.13.0
pkgrel=6
pkgdesc="Enhance the standard unittest package with features for testing asyncio libraries"
url="https://github.com/Martiusweb/asynctest"
license=('Apache')
arch=('any')
depends=('python38')
makedepends=('python38-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Martiusweb/asynctest/archive/v$pkgver.tar.gz")
sha512sums=('cfa76a461c81d702f96cc06d6a6786c35373802a4d878927a1f11eaad741aef8e55130e4b07cfc78673210f0ebf45bf808b7c43aebb1b2835f40306b5e44b141')

build() {
  cd asynctest-$pkgver
  python3.8 setup.py build
}

check() {
  cd asynctest-$pkgver
  python3.8 -m unittest test || :
}

package() {
  cd asynctest-$pkgver
  python3.8 setup.py install --root="$pkgdir" --optimize=1
}
