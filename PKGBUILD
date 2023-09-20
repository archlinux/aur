# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="harlequin"
pkgver=1.0.0
pkgrel=1
pkgdesc="The DuckDB IDE for Your Terminal"
url="https://harlequin.sh/"
license=("MIT")
arch=("any")
depends=("python"
         "python-textual"
         "python-textual-textarea"
         "python-click"
         "python-duckdb"
         "python-shandy-sqlfmt"
         "python-platformdirs"
         "python-pyperclip"
         "python-black"
         "python-ruff"
         "mypy"
         "python-types-pygments"
        )
makedepends=("python-build" "python-installer" "python-wheel")
options=("!strip")
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
b2sums=('b191e694d32bb6fc1520f4c4cebf203022cec58b4fe9f6037e6ce53c20bc60fc10af953d2843e8ebba30641d2c7d52a25840436297d99aa0d116c10f1494499f')

build(){
 cd "$pkgname-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$pkgname-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
