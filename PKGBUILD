# Maintainer: Yoann Laissus <yoann.laissus@gmail.com>

pkgname=python-sqlite3-to-mysql
_pyname='sqlite3_to_mysql'
pkgver=2.6.0
pkgrel=2
pkgdesc='A simple Python tool to transfer data from SQLite 3 to MySQL'
arch=('any')
url='https://pypi.org/project/sqlite3-to-mysql/'
license=('MIT')
depends=('python' 'python-click' 'python-mysql-connector' 'python-pytimeparse2' 'python-dateutil' 'python-simplejson' 'python-tqdm' 'python-packaging' 'python-tabulate' 'python-unidecode' 'python-typing_extensions' 'python-sqlglot')
makedepends=('python-setuptools' 'python-hatchling')
_archive="$_pyname-$pkgver"
source=("https://pypi.python.org/packages/source/s/sqlite3-to-mysql/sqlite3_to_mysql-${pkgver}.tar.gz")
sha512sums=('f6122e8d78b34322d5cd7ddf64b5103aec0e941b3fd53fe6b6f3cd25fd28ff37ad9314f93cfbc5038075cc9102de3ad9a26ebbbce464c86eab2e29b02db71c48')

build() {
  cd "$_archive"
  python3 -m build --sdist --wheel
}

package() {
  cd "$_archive"
  python -I -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
 
