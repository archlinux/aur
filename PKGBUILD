# Maintainer: Yoann Laissus <yoann.laissus@gmail.com>

pkgname=python-sqlite3-to-mysql
_pyname='sqlite3_to_mysql'
pkgver=2.0.3
pkgrel=1
pkgdesc='A simple Python tool to transfer data from SQLite 3 to MySQL'
arch=('any')
url='https://pypi.org/project/sqlite3-to-mysql/'
license=('MIT')
depends=('python' 'python-click' 'python-mysql-connector' 'python-pytimeparse2' 'python-simplejson' 'python-tqdm' 'python-packaging' 'python-tabulate' 'python-unidecode' 'python-typing_extensions')
makedepends=('python-setuptools')
_archive="$_pyname-$pkgver"
source=("https://pypi.python.org/packages/source/s/sqlite3-to-mysql/sqlite3_to_mysql-${pkgver}.tar.gz")
sha512sums=('be7157a67055be89b2a69800af743d5960893cfcc518ba7832725285000b8138dbc7cc7575b7914cfb7ffeffc565e5c6b02b6a340ef6f313627a47c6cad2a87b')

build() {
  cd "$_archive"
  python3 -m build --sdist --wheel
}

package() {
  cd "$_archive"
  python -m installer -d "$pkgdir" dist/*.whl
}
 
