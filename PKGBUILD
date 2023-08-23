# Maintainer: mark.blakeney at bullet-systems dot net
pkgname=wordle-aid
pkgver=2.3
pkgrel=1
pkgdesc="CLI program to filter word choices to aid solving Wordle game problems"
url="https://github.com/bulletmark/$pkgname"
license=(GPL3)
arch=(any)
depends=("python>=3.6" "python-pyspellchecker")
makedepends=(python-setuptools python-build python-installer
             python-wheel python-setuptools-scm)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha1sums=('7816408095ca58291dcddf6e5e3ed218c71c7d34')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver" python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
