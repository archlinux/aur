# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="python-grep-ast"
_pkgname="grep_ast"
pkgver=0.7.2
pkgrel=1
pkgdesc="Grep source code and see useful code context about matching lines"
url="https://github.com/paul-gauthier/grep-ast"
depends=("python-tree-sitter-languages" "python-pathspec")
makedepends=("python-setuptools" "python-build" "python-installer" "python-wheel")
license=("Apache2")
arch=("any")
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
b2sums=('0f10758ebba0d30a22fe7efe6a69436ebe00a4a032462b42e8887b111130ad883c1e9875a1741dd2129c0858e3c07c08d0a1da50cfc71d0152b65c3be6ce036b')

build(){
 cd "$_pkgname-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$_pkgname-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
