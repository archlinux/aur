# Maintainer: mark.blakeney at bullet-systems dot net
pkgname=sleep-inhibitor
pkgver=1.20
pkgrel=1
pkgdesc="Program to run plugins to inhibit system sleep/suspend"
url="https://github.com/bulletmark/$pkgname"
license=(GPL3)
arch=(any)
backup=("etc/$pkgname.conf")
depends=("python>=3.7" "python-ruamel-yaml")
makedepends=(python-setuptools python-build python-installer python-wheel)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha1sums=('1705a486fe36a7206da87d2a1e24882595f71dab')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
