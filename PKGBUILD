# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
pkgname=('python-beautifultable')
_name=${pkgname#python-}
pkgver=1.1.0
pkgrel=1
pkgdesc="Python package for printing visually appealing tables on a terminal"
arch=('any')
url='https://github.com/pri22296/beautifultable'
license=('MIT')
makedepends=('python-setuptools')
depends=('python-wcwidth')
optdepends=('python-pandas: BeautifulTable.from_df and BeautifulTable.to_df')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('fa7fc37acd73ea44ad6caa353b9ac39f8ef01d5befada27ec05ae6232edd7eff')

check() {
  cd "$srcdir/$_name-$pkgver"
  python -m unittest test.py
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
