# Maintainer: Carl Smedstad <antoniovazquezblanco@gmail.com>

pkgname=python-coverxygen
_name=${pkgname#python-}
pkgver=1.8.1
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
  '3e1e42b4ca08439360c060705e04b6f77815eb72c2babc2abdb1b45df9064801a0adc80b99676260fa53764331740fbc7adee060d8bd1a8155b054a91cfbb09d'
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
