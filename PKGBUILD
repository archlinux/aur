# Maintainer: mark.blakeney at bullet-systems dot net
_pkgname=timesched
pkgname=python-$_pkgname
pkgver=1.9
pkgrel=1
pkgdesc="Python module providing a simple time event scheduler"
url="https://github.com/bulletmark/$_pkgname"
license=("GPL-3.0-or-later")
arch=("any")
depends=("python>=3.6")
makedepends=(python-setuptools python-build python-installer
             python-wheel python-setuptools-scm)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha1sums=('ae49370909b01ada7e50d1f43a5107d0a1193463')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver" python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
