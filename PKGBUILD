# Maintainer: mark.blakeney at bullet-systems dot net
pkgname=wordle-aid
pkgver=2.12
pkgrel=1
pkgdesc="CLI program to filter word choices to aid solving Wordle game problems"
url="https://github.com/bulletmark/$pkgname"
license=(GPL-3.0-or-later)
arch=(any)
depends=("python>=3.10" "python-pyspellchecker" "python-argparse-from-file")
makedepends=(python-setuptools python-build python-installer
             python-wheel python-setuptools-scm)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha1sums=('bbc28e8d1afa2180d38280e4ec596a22b0202b8e')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver" python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
