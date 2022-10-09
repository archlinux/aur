# Maintainer: mark.blakeney at bullet-systems dot net
pkgname=sleep-inhibitor
pkgver=1.16
pkgrel=1
pkgdesc="Program to run plugins to inhibit system sleep/suspend"
url="https://github.com/bulletmark/$pkgname"
license=(GPL3)
arch=(any)
backup=("etc/$pkgname.conf")
depends=("python>=3.6" "python-ruamel-yaml")
makedepends=(python-setuptools python-build python-installer python-wheel)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha1sums=('75d5dc2477e66b83ae7bdcee200e89557bdaa763')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
