# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="python-grep-ast"
_pkgname="grep_ast"
pkgver=0.8.1
pkgrel=1
pkgdesc="Grep source code and see useful code context about matching lines"
url="https://github.com/paul-gauthier/grep-ast"
depends=("python-tree-sitter-language-pack" "python-pathspec")
makedepends=("python-setuptools" "python-build" "python-installer" "python-wheel")
license=("Apache2")
arch=("any")
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
b2sums=('1c8dad6f5005ae21502b1a2c059937bdd0883923bd83db965f9da67b67aaf1ebe0a0a721fd9c35fb2f08e28a5380744ba3b5be093de6b6ad689f39dad0009a08')

build(){
 cd "$_pkgname-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$_pkgname-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
