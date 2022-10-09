# Maintainer: mark.blakeney at bullet-systems dot net
pkgname=docker-machine-add-ssh
pkgver=1.7
pkgrel=1
pkgdesc="Adds docker-machine ssh configuration to your personal ssh
configuration"
url="https://github.com/bulletmark/$pkgname"
license=(GPL3)
arch=(any)
depends=("python>=3.6")
makedepends=(python-setuptools python-build python-installer python-wheel)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha1sums=('6988ecac61d0441331b60d085f423e935ccb6cc8')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
