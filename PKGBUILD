# Maintainer: mark.blakeney at bullet-systems dot net
pkgname=debugpy-run
pkgver=1.12
pkgrel=1
pkgdesc='Finds and runs debugpy for VS Code "remote attach" command line debugging'
url="https://github.com/bulletmark/$pkgname"
license=(GPL-3.0-or-later)
arch=(any)
depends=("python>=3.6" "python-packaging")
makedepends=(python-setuptools python-build python-installer
             python-wheel python-setuptools-scm)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha1sums=('1bb977690a9ecddb4fd836b95dd96e9be9baa10b')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver" python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
