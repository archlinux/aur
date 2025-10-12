# Maintainer: mark.blakeney at bullet-systems dot net
_pkgname=argparse-from-file
pkgname=python-$_pkgname
pkgver=1.5
pkgrel=1
pkgdesc="Wrapper around argparse to prepend options from a user configuration file"
url="https://github.com/bulletmark/$_pkgname"
license=("GPL-3.0-or-later")
arch=("any")
depends=("python>=3.8" "python-platformdirs")
makedepends=(python-setuptools python-build python-installer
             python-wheel python-setuptools-scm)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha1sums=('899bc5f010cd2f16cb4641c575a8f417122e1c3f')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver" python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
