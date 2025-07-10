# Maintainer: mark.blakeney at bullet-systems dot net
pkgname=pdfcmd
pkgver=1.13
pkgrel=1
pkgdesc='Utility to perform commands on PDF files.'
url="https://github.com/bulletmark/$pkgname"
license=(GPL-3.0-or-later)
arch=(any)
depends=("python>=3.5" "python-pypdf>=3.1.0" "python-argcomplete")
makedepends=(python-setuptools python-build python-installer
             python-wheel python-setuptools-scm)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha1sums=('8fcc983bcb04ff36a7df782bdf0560d11de13a7b')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver" python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
