# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="python-grep-ast"
_pkgname="${pkgname#python-}"
pkgver=0.2.4
pkgrel=1
pkgdesc="Grep source code and see useful code context about matching lines"
url="https://github.com/paul-gauthier/grep-ast"
depends=("python-tree-sitter-languages" "python-pathspec")
makedepends=("python-setuptools" "python-build" "python-installer" "python-wheel")
license=("Apache2")
arch=("any")
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
b2sums=('fe182d4002078632b3aa1a05ef1757868a34c9d4beaf752d7817fa87bc9c7fe29fea7034439221192af578d2f7cf948ecad2488a0993a973c6e004ea465a0801')

build(){
 cd "$_pkgname-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$_pkgname-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
