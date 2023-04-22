# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Richard Quirk

pkgname=cmake-lint
pkgver=1.4.2
pkgrel=3
pkgdesc="Check for coding style issues in CMake files"
arch=(any)
url="https://github.com/cmake-lint/cmake-lint"
license=(Apache)
makedepends=(
  python-setuptools
  python-pytest-runner
)
depends=(
  python
)

source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('bf060987c74e07890f7314a4832c2e54ffb9c5c1e6d799387bc438010f918676')

_archive="$pkgname-$pkgver"

build() {
  cd "$_archive"

  python setup.py build
}

package() {
  cd "$_archive"

  export PYTHONHASHSEED=0
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
