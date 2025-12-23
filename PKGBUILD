# Maintainer: Peter <peter.w.adams96@gmail.com>
pkgname=python-sqlit-tui
pkgver=1.1.6
pkgrel=1
pkgdesc="The lazygit of SQL databases - a lightweight TUI for SQL Server, PostgreSQL, MySQL, SQLite, and more"
arch=('any')
url="https://github.com/Maxteabag/sqlit"
license=('MIT')
depends=(
    'python'
    'python-textual'
    'python-textual-fastdatatable'
    'python-pyperclip'
    'python-keyring'
    'python-docker'
)
optdepends=(
    'python-psycopg2: PostgreSQL, CockroachDB and Supabase support'
    'python-pyodbc: SQL Server support'
    'python-mysql-connector: MySQL support'
    'python-mariadb-connector: MariaDB support'
    'python-oracledb: Oracle support'
    'python-duckdb: DuckDB support'
    'python-clickhouse-connect: ClickHouse support'
    'python-requests: Cloudflare D1 support'
    'python-snowflake-connector-python: Snowflake support'
    'python-paramiko: SSH tunnel support'
    'python-sshtunnel: SSH tunnel support'
)
makedepends=('python-build' 'python-installer' 'python-hatchling')
source=("https://files.pythonhosted.org/packages/source/s/sqlit-tui/sqlit_tui-${pkgver}.tar.gz")
sha256sums=('82a01f08a71cdfe7db95aa52758c40987c75c279a3b3db3afbd9e16c20525367')

build() {
    cd "sqlit_tui-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "sqlit_tui-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
