# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
# Updated by https://github.com/neomutt/tree-sitter-lsp/blob/main/.github/workflows/main.yml
_pkgname=tree-sitter-lsp
pkgname=python-$_pkgname
pkgver=0.0.13
pkgrel=1
pkgdesc="a library to create language servers"
arch=(any)
url=https://github.com/neomutt/$_pkgname
depends=(python-colorama python-jinja python-jsonschema python-pygls python-tree-sitter)
optdepends=(python-beautifulsoup4 python-pypandoc python-markdown-it-py python-pygments python-platformdirs python-yaml python-tomli-w)
makedepends=(python-installer)
license=(GPL3)
_py=py3
source=("https://files.pythonhosted.org/packages/$_py/${_pkgname::1}/${_pkgname//-/_}/${_pkgname//-/_}-$pkgver-$_py-none-any.whl")
sha256sums=('db4fec2b7da11873d6d4eb73e9f1271ea039e4f86be6ba0b583e3a1b58a3fdc1')

package() {
	python -minstaller -d"$pkgdir" ./*.whl
}
