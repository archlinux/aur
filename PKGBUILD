# Maintainer: mark.blakeney at bullet-systems dot net
pkgname=pdfcmd
pkgver=1.6
pkgrel=1
pkgdesc='Utility to perform commands on PDF files.'
url="https://github.com/bulletmark/$pkgname"
license=(GPL3)
arch=(any)
depends=("python>=3.5" "python-pypdf")
makedepends=(python-setuptools python-build python-installer python-wheel)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha1sums=('bce57b9fd25bbdb4ede3715706e70314a50358e9')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
