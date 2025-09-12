# Maintainer: AlphaJack <alphajack at tuta dot io>
# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

pkgname="harlequin"
pkgver=2.1.3
pkgrel=1
pkgdesc="The SQL IDE for Your Terminal"
url="https://harlequin.sh/"
license=("MIT")
arch=("any")
depends=("python"
         "python-textual"
         "python-textual-fastdatatable"
         "python-textual-textarea"
         "python-click"
         "python-rich-click"
         "python-duckdb"
         "python-shandy-sqlfmt"
         "python-platformdirs"
         "python-pyperclip"
         "python-importlib-metadata"
         "python-tomli"
         "python-tomlkit"
         "python-questionary"
         "python-black"
         "python-ruff"
         "mypy")
optdepends=('harlequin-mysql: MySQL support'
            'harlequin-postgres: Postgres support'
            'harlequin-odbc: ODBC support')
options=("!strip")
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
b2sums=('ad3d155c7ca58b7b9978ee2b7bc88caf011552d1806142830f6458042df9b7f551a0ee785fa7e471f3e942b9d6315525bd0cd6bc9ef568a54198f0ddeef23201')

build(){
    cd "$pkgname-$pkgver"

    python -m build --wheel --no-isolation
}

package(){
    cd "$pkgname-$pkgver"

    python -m installer --destdir="$pkgdir" dist/*.whl
}
