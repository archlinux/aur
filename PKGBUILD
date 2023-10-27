# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
# Updated by https://github.com/Freed-Wu/tree-sitter-lsp/blob/main/.github/workflows/main.yml
_pkgname=tree-sitter-lsp
pkgname=python-$_pkgname
pkgver=0.0.2
pkgrel=1
pkgdesc="a library to create language servers"
arch=(any)
url=https://github.com/Freed-Wu/$_pkgname
depends=(python-colorama python-jinja python-jsonschema python-pygls python-tree-sitter)
optdepends=(python-beautifulsoup4 python-pypandoc python-markdown-it-py python-pygments python-platformdirs)
makedepends=(python-installer)
license=(GPL3)
_py=py3
source=("https://files.pythonhosted.org/packages/$_py/${_pkgname::1}/${_pkgname//-/_}/${_pkgname//-/_}-$pkgver-$_py-none-any.whl")
sha256sums=('e06b88fa19a8c2078bc33a0c662be615b635c3537942971ab9c7d69b1ed3c806')

package() {
	python -minstaller -d"$pkgdir" ./*.whl
}
