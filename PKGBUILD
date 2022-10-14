# Maintainer: mark.blakeney at bullet-systems dot net
pkgname=pkglog
pkgver=1.11
pkgrel=1
pkgdesc="Reports log of package updates"
url="https://github.com/bulletmark/$pkgname"
license=(GPL3)
arch=(any)
depends=("python>=3.7" "python-rich")
makedepends=(python-setuptools python-build python-installer python-wheel)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha1sums=('bf04e99dc457b0ff6d9f715fd6d6509cab43a8b8')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
