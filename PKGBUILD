# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
# Updated by https://github.com/neomutt/lsp-tree-sitter/blob/main/.github/workflows/main.yml
_pkgname=lsp-tree-sitter
pkgname=python-$_pkgname
pkgver=0.0.16
pkgrel=1
pkgdesc="a library to create language servers"
arch=(any)
url=https://github.com/neomutt/$_pkgname
depends=(python-colorama python-jinja python-jsonschema python-pygls python-tree-sitter)
optdepends=(python-beautifulsoup4 python-pypandoc python-markdown-it-py python-pygments python-platformdirs python-yaml python-tomli-w)
makedepends=(python-installer)
replaces=(python-tree-sitter-lsp)
license=(GPL3)
_py=py3
source=("https://files.pythonhosted.org/packages/$_py/${_pkgname::1}/${_pkgname//-/_}/${_pkgname//-/_}-$pkgver-$_py-none-any.whl")
sha256sums=('45724b45b786cabf2d17ee8135fa6caacb9a5631f5c41d51980229cfa589fcf6')

package() {
	python -minstaller -d"$pkgdir" ./*.whl
}
