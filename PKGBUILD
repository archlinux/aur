# Maintainer: mark.blakeney at bullet-systems dot net
pkgname=pdfcmd
pkgver=1.7
pkgrel=1
pkgdesc='Utility to perform commands on PDF files.'
url="https://github.com/bulletmark/$pkgname"
license=(GPL3)
arch=(any)
depends=("python>=3.5" "python-pypdf")
makedepends=(python-setuptools python-build python-installer python-wheel)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha1sums=('689a61f7d02ecf0ddf6ff2671c4835cf3a31f8b7')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
