# Maintainer: mark.blakeney at bullet-systems dot net
pkgname=cdhist
pkgver=4.2
pkgrel=1
pkgdesc="Linux shell cd history"
url="https://github.com/bulletmark/$pkgname"
license=(GPL-3.0-or-later)
arch=(any)
depends=("python>=3.8")
makedepends=(python-setuptools python-build python-installer
             python-wheel python-setuptools-scm)
install="install.sh"
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha1sums=('876890aaafa66cbe9ea39c5374909b9d74160c44')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver" python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
