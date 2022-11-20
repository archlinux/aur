# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
# Maintainer: Bruno Pagani <archange@archlinux.org>
# Contributor: Sebastien Binet <binet@lblbox>

pkgname=python38-numexpr
pkgver=2.8.4
pkgrel=1
pkgdesc="Fast numerical array expression evaluator for Python 3.8, NumPy, PyTables, pandas"
url="https://github.com/pydata/numexpr"
arch=(x86_64)
license=(MIT)
depends=(python38-numpy)
makedepends=(python38-setuptools)
source=(https://github.com/pydata/numexpr/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('0e21addd25db5f62d60d97e4380339d9c1fb2de72c88b070c279776ee6455d10')

build() {
  cd numexpr-$pkgver
  python3.8 setup.py build
}
package() {
  cd numexpr-$pkgver
  python3.8 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname/
}
