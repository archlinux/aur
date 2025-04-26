# Maintainer: AlphaJack <alphajack at tuta dot io>
# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

pkgname="harlequin"
pkgver=2.1.2
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
b2sums=('d8bb58657fbd13580a22b7df29a8b22a325a54ad7ddd68837687231d0211d344ab72e40c468077da051a8d33ae659e266e8c141439992f160b87474d21692df0')

build(){
    cd "$pkgname-$pkgver"

    python -m build --wheel --no-isolation
}

package(){
    cd "$pkgname-$pkgver"

    python -m installer --destdir="$pkgdir" dist/*.whl
}
