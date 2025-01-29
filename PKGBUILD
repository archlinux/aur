# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="harlequin"
pkgver=2.0.1
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
makedepends=("python-build"
             "python-installer"
             "python-poetry"
             "python-wheel")
options=("!strip")
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
b2sums=('96c8fe9e280325f848240808703f491575768d58c462dbb720e2e6c8e7b7ad8a2e8f16a7bfbb76d8199af4fd4640f002f230966bf898d6cc7269ba6a976dd239')

build(){
 cd "$pkgname-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$pkgname-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
