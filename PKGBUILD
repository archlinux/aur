# Maintainer: Timo Denissen <timo+aur(at)familiedenissen.de>
# Contributor: Josip Ponjavic <josipponjavic at gmail dot com>

pkgname=python-iso3166
pkgver=2.1.1
pkgrel=1
pkgdesc="Self-contained ISO 3166-1 country definitions."
arch=('any')
url="https://github.com/deactivated/python-iso3166"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('89e6b3d2afff9faf320faa826a2b081853200fdd5acd5362d770fe252d0c258b')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --skip-build -O1 --root="$pkgdir"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
