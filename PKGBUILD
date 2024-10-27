# Maintainer: Yoann Laissus <yoann.laissus@gmail.com>

pkgname=python-sqlite3-to-mysql
_pyname='sqlite3_to_mysql'
pkgver=2.3.2
pkgrel=1
pkgdesc='A simple Python tool to transfer data from SQLite 3 to MySQL'
arch=('any')
url='https://pypi.org/project/sqlite3-to-mysql/'
license=('MIT')
depends=('python' 'python-click' 'python-mysql-connector' 'python-pytimeparse2' 'python-simplejson' 'python-tqdm' 'python-packaging' 'python-tabulate' 'python-unidecode' 'python-typing_extensions')
makedepends=('python-setuptools')
_archive="$_pyname-$pkgver"
source=("https://pypi.python.org/packages/source/s/sqlite3-to-mysql/sqlite3_to_mysql-${pkgver}.tar.gz")
sha512sums=('52e1c4cc8ab1cae2dcdccc50ec207817f696c221d8171f69a5e9a77af128528121313fb1a9704327df8c7df412c78ea6c857f7a3a6d6d9de9b47dbf201278d36')

build() {
  cd "$_archive"
  python3 -m build --sdist --wheel
}

package() {
  cd "$_archive"
  python -m installer -d "$pkgdir" dist/*.whl
}
 
