# Maintainer: mark.blakeney at bullet-systems dot net
pkgname=wordle-aid
pkgver=2.8
pkgrel=1
pkgdesc="CLI program to filter word choices to aid solving Wordle game problems"
url="https://github.com/bulletmark/$pkgname"
license=(GPL-3.0-or-later)
arch=(any)
depends=("python>=3.8" "python-pyspellchecker" "python-platformdirs")
makedepends=(python-setuptools python-build python-installer
             python-wheel python-setuptools-scm)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha1sums=('ff2b1b133125b1deacda078253d952be1b66e5d6')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver" python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
