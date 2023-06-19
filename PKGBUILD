# Maintainer: Carl Smedstad <antoniovazquezblanco@gmail.com>

pkgname=python-coverxygen
_name=${pkgname#python-}
pkgver=1.8.0
pkgrel=1
pkgdesc="Generate doxygen's documentation coverage report"
arch=(x86_64)
url="https://github.com/psycofdj/coverxygen"
license=(GPL)
makedepends=(
  python-build
  python-setuptools
  python-wheel
)
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/${pkgver}.tar.gz"
)
sha512sums=(
  'ab6e42eedb147bbf49ed0b61fc7e41ac42deccfa0c0ae7c0febe04f30ee38ed48f09779d6ac527b67371eef5d90c3d7cb6738ee3696819c2fef7006f8e85b923'
)

_archive="$_name-$pkgver"

build() {
  cd "$_archive"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_archive"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
