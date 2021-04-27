# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Richard Quirk

pkgname=cmake-lint
pkgver=1.4.1
pkgrel=1
pkgdesc="Check for coding style issues in CMake files"
arch=('any')
url="https://github.com/cmake-lint/cmake-lint"
license=('Apache')
depends=('python')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('7be6c4bab4c46c21a4c96cc8451ec112ee6c6190ff97a169f0920be5711c49def38e02926da2cf37c2f3a227ccb858defd310eed8f87b79a2c21ce643942110f')

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$pkgname-$pkgver"
  export PYTHONHASHSEED=0
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
