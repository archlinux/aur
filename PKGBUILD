# Maintainer: Carl Smedstad <antoniovazquezblanco@gmail.com>

pkgname=python-coverxygen
_name=${pkgname#python-}
pkgver=1.7.0
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
  'd31b8a5c02943ed171326cf9d926b981b5381ead64922cc415ca2360307df2b129615578087dfec5b733b0301d3f45f7d721fcc3f1d13b37057cb81296c65561'
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
