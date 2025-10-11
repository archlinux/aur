# Maintainer: mark.blakeney at bullet-systems dot net
pkgname=docker-machine-add-ssh
pkgver=1.9
pkgrel=2
pkgdesc="Adds docker-machine ssh configuration to your personal ssh
configuration"
url="https://github.com/bulletmark/$pkgname"
license=(GPL-3.0-or-later)
arch=(any)
depends=("python>=3.8" "python-argparse-from-file")
makedepends=(python-setuptools python-build python-installer
             python-wheel python-setuptools-scm)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha1sums=('801015a5c284cc5985c14511b9d97996ed22479f')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver" python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
