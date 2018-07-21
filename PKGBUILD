# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-asynctest
pkgver=0.12.2
pkgrel=1
pkgdesc="Enhance the standard unittest package with features for testing asyncio libraries"
url="https://github.com/Martiusweb/asynctest"
license=('Apache')
arch=('any')
depends=('python')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Martiusweb/asynctest/archive/v$pkgver.tar.gz")
sha512sums=('e182fcf0c42d726dde810b9e2d50492b9e5ec9209b5419bd5faef28ee475ff04d6c8220bc165ec506eb9fc2dd38e45d7c3f8bc4ba1f0e279e44214e39862fe0f')

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
