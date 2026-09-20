# Maintainer: Yoann Laissus <yoann.laissus@gmail.com>

pkgname=python-sqlite3-to-mysql
_pyname='sqlite3_to_mysql'
pkgver=2.6.1
pkgrel=1
pkgdesc='A simple Python tool to transfer data from SQLite 3 to MySQL'
arch=('any')
url='https://pypi.org/project/sqlite3-to-mysql/'
license=('MIT')
depends=('python' 'python-click' 'python-mysql-connector' 'python-pytimeparse2' 'python-dateutil' 'python-simplejson' 'python-tqdm' 'python-packaging' 'python-tabulate' 'python-unidecode' 'python-typing_extensions' 'python-sqlglot')
makedepends=('python-setuptools' 'python-hatchling')
_archive="$_pyname-$pkgver"
source=("https://pypi.python.org/packages/source/s/sqlite3-to-mysql/sqlite3_to_mysql-${pkgver}.tar.gz")
sha512sums=('0bf7d3171841a758a209e52def18b2cfcf4978810ada613f43a73c9599abe5b046a3dff53f652179ea4fd3e9c0f6683302fcbdca418e320e96148bc2e7921b7d')

build() {
  cd "$_archive"
  python3 -m build --sdist --wheel
}

package() {
  cd "$_archive"
  python -I -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
 
