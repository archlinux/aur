# Maintainer: mark.blakeney at bullet-systems dot net
pkgname=pdfcmd
pkgver=1.5
pkgrel=1
pkgdesc='Utility to perform commands on PDF files.'
url="https://github.com/bulletmark/$pkgname"
license=(GPL3)
arch=(any)
depends=("python>=3.5" "python-pypdf2>=2.0.0")
makedepends=(python-setuptools python-build python-installer python-wheel)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha1sums=('136f3418de657fffc888a6d73c8f4cc4dae131bc')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
