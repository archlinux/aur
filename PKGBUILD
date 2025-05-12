# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="python-grep-ast"
_pkgname="grep_ast"
pkgver=0.9.0
pkgrel=1
pkgdesc="Grep source code and see useful code context about matching lines"
url="https://github.com/paul-gauthier/grep-ast"
depends=("python-tree-sitter-language-pack" "python-pathspec")
makedepends=("python-setuptools" "python-build" "python-installer" "python-wheel")
license=("Apache2")
arch=("any")
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
b2sums=('c4e6244ff9ac4795cb836a7b759279309d8f5d8fbeaa16409c7278bee4025fb20b07a4e0326596ea7c1b46e82e381ab41139fdb4f82c8a61b3f938c44e065900')

build(){
 cd "$_pkgname-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$_pkgname-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
