# Maintainer: Yoann Laissus <yoann.laissus@gmail.com>

pkgname=python-sqlite3-to-mysql
_pyname='sqlite3_to_mysql'
pkgver=2.5.5
pkgrel=2
pkgdesc='A simple Python tool to transfer data from SQLite 3 to MySQL'
arch=('any')
url='https://pypi.org/project/sqlite3-to-mysql/'
license=('MIT')
depends=('python' 'python-click' 'python-mysql-connector' 'python-pytimeparse2' 'python-dateutil' 'python-simplejson' 'python-tqdm' 'python-packaging' 'python-tabulate' 'python-unidecode' 'python-typing_extensions' 'python-sqlglot')
makedepends=('python-setuptools' 'python-hatchling')
_archive="$_pyname-$pkgver"
source=("https://pypi.python.org/packages/source/s/sqlite3-to-mysql/sqlite3_to_mysql-${pkgver}.tar.gz")
sha512sums=('22a4a0a19efabe497b98e9b8f9d68d7e49e402b800a6229d1d7b0291928c6e6ca2a590eb7f0243e00a8ae286866c3038ca2d22111c291c8c7d10f0f8b3de90d8')

build() {
  cd "$_archive"
  python3 -m build --sdist --wheel
}

package() {
  cd "$_archive"
  python -I -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
 
