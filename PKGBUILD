# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-asynctest
pkgver=0.12.3
pkgrel=1
pkgdesc="Enhance the standard unittest package with features for testing asyncio libraries"
url="https://github.com/Martiusweb/asynctest"
license=('Apache')
arch=('any')
depends=('python')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Martiusweb/asynctest/archive/v$pkgver.tar.gz")
sha512sums=('a5c63fe27c43498eae8fd6ea12fe2dba7a0cc4916cba83ddccc66e80b0d49318c0d506149fdc45eb78a25e63efae133d040be37ff7f8feacab4d8aba6f02e0a8')

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
