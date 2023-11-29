# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
# Updated by https://github.com/Freed-Wu/tree-sitter-lsp/blob/main/.github/workflows/main.yml
_pkgname=tree-sitter-lsp
pkgname=python-$_pkgname
pkgver=0.0.4
pkgrel=1
pkgdesc="a library to create language servers"
arch=(any)
url=https://github.com/Freed-Wu/$_pkgname
depends=(python-colorama python-jinja python-jsonschema python-pygls python-tree-sitter)
optdepends=(python-beautifulsoup4 python-pypandoc python-markdown-it-py python-pygments python-platformdirs python-yaml python-tomli-w)
makedepends=(python-installer)
license=(GPL3)
_py=py3
source=("https://files.pythonhosted.org/packages/$_py/${_pkgname::1}/${_pkgname//-/_}/${_pkgname//-/_}-$pkgver-$_py-none-any.whl")
sha256sums=('dd00a7c08df1e86bd899f9bc56753d2041bbebf17b2fbead43a98296754ea904')

package() {
	python -minstaller -d"$pkgdir" ./*.whl
}
