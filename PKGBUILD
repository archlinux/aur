# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-asynctest
pkgver=0.12.4
pkgrel=1
pkgdesc="Enhance the standard unittest package with features for testing asyncio libraries"
url="https://github.com/Martiusweb/asynctest"
license=('Apache')
arch=('any')
depends=('python')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Martiusweb/asynctest/archive/v$pkgver.tar.gz")
sha512sums=('91bffeb37991f01cb83016184706a71b8a1ebf084000f48ab8527e603285d32a55b0d3200f0c8e249bfd2393b3ed75cad10314027e9815bb15847b5db46ae75e')

build() {
  cd asynctest-$pkgver
  python setup.py build
}

check() {
  cd asynctest-$pkgver
  python -m unittest test
}

package() {
  cd asynctest-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}
