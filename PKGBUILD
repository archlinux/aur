# Maintainer: mark.blakeney at bullet-systems dot net
pkgname=b2restore
pkgver=1.11
pkgrel=1
pkgdesc="Program to recreate Backblaze B2 file archive at specified date+time."
url="https://github.com/bulletmark/$pkgname"
license=(GPL3)
arch=(any)
depends=("python>=3.5")
makedepends=(python-build python-installer python-wheel)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
md5sums=('625026dfe6a1385557bed7735413e780')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
