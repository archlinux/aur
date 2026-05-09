# Maintainer: Popolon < popolon @L popolon d0t org>
# Generator: pip2pkgbuild, handcraft tuning

pkgname='python-mysql-to-sqlite3'
_module='mysql-to-sqlite3'
_src_folder='mysql_to_sqlite3-2.6.0'
pkgver='2.6.0'
_src_folder="mysql_to_sqlite3-${pkgver}"
pkgrel=3
pkgdesc="A simple Python tool to transfer data from MySQL to SQLite 3"
url="https://techouse.github.io/mysql-to-sqlite3/"
depends=('python' 'python-mysql-connector' 'python-sqlglot>=30.0.0')
makedepends=('python-build' 'python-installer' 'python-wheel')
conflicts=('mysql2sqlite')
license=('custom:MIT License')
arch=('any')
source=("https://github.com/techouse/${_module}/releases/download/v${pkgver}/${_src_folder}.tar.gz")
sha256sums=('b465354a82205a23523d4886ae76579872d266f0444ff5c4d5f89dcb858ce253')

build() {
    cd "${srcdir}/${_src_folder}"
    python -m build --wheel --no-isolation
}

package() {

    cd "${srcdir}/${_src_folder}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
