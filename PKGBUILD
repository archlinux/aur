# Maintainer: mark.blakeney at bullet-systems dot net
pkgname=mpr
pkgver=1.24
pkgrel=1
pkgdesc="Wrapper for MicroPython mpremote tool"
url="https://github.com/bulletmark/$pkgname"
license=(GPL3)
arch=(any)
depends=("python>=3.6" "python-platformdirs" "python-argcomplete"
         "python-inotify-simple")
makedepends=(python-setuptools python-build python-installer
             python-wheel python-setuptools-scm)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha1sums=('7f55a857250cbd4002efd5cf0cbdc369830f323e')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver" python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
