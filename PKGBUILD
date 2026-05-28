# Maintainer: mark.blakeney at bullet-systems dot net
pkgname=pinstall
pkgver=1.26
pkgrel=1
pkgdesc="Installer Tool for Python Programs"
url="https://github.com/bulletmark/$pkgname"
license=(GPL-3.0-or-later)
arch=(any)
depends=("python>=3.11" "sudo" "python-packaging" "python-platformdirs")
makedepends=(python-setuptools python-build python-installer
             python-wheel python-setuptools-scm)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha1sums=('fdc6e99a9f2d5672e0b0ce1903589084723ab7c8')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver" python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
