# Maintainer: mark.blakeney at bullet-systems dot net
pkgname=mpr
pkgver=1.27
pkgrel=1
pkgdesc="Wrapper for MicroPython mpremote tool"
url="https://github.com/bulletmark/$pkgname"
license=(GPL-3.0-or-later)
arch=(any)
depends=("python>=3.8" "python-platformdirs" "python-argcomplete"
         "python-inotify-simple")
makedepends=(python-setuptools python-build python-installer
             python-wheel python-setuptools-scm)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha1sums=('b34bc2224bd974cb16329d32c8f8d2470a9743c7')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver" python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
