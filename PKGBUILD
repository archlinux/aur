# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Sebastien LEDUC <sebastien@sleduc.fr>
# Contributor: Andrey Mikhaylenko <neithere at gmail dot com>
pkgname=python2-pytest-cov
_name=${pkgname#python2-}
pkgver=2.12.1
pkgrel=3
pkgdesc='Coverage plugin for pytest'
arch=('any')
license=('MIT')
url='https://github.com/schlamar/pytest-cov'
depends=('python2-pytest' 'python2-coverage' 'python2-toml')
makedepends=('python2-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('13e96921e9a20a986f8909b1f546bd9d3ad8ed5fc6256898ff2ba4f46c4b23be')

build() {
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
