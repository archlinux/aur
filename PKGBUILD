# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
# Updated by https://github.com/Freed-Wu/tree-sitter-lsp/blob/main/.github/workflows/main.yml
_pkgname=tree-sitter-lsp
pkgname=python-$_pkgname
pkgver=0.0.1
pkgrel=1
pkgdesc="a library to create language servers"
arch=(any)
url=https://github.com/Freed-Wu/$_pkgname
depends=(python-colorama python-jinja python-jsonschema python-platformdirs python-pygls python-tree-sitter)
optdepends=(python-beautifulsoup4 python-pypandoc python-markdown-it-py)
makedepends=(python-installer)
license=(GPL3)
_py=py3
source=("https://files.pythonhosted.org/packages/$_py/${_pkgname::1}/${_pkgname//-/_}/${_pkgname//-/_}-$pkgver-$_py-none-any.whl")
sha256sums=('f2c1d535ed3af0917cf4e437366659f658efda91c469a9d619075a14327705b7')

package() {
	cd "$_pkgname" || return 1
	python -minstaller -d"$pkgdir" ./*.whl
}
