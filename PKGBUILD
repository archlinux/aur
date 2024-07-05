# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
# Updated by https://github.com/Freed-Wu/autotools-language-server/blob/main/.github/workflows/main.yml
pkgname=autotools-language-server
pkgver=0.0.20
pkgrel=1
pkgdesc="autotools language server"
arch=(any)
url=https://github.com/Freed-Wu/autotools-language-server
depends=(python-tree-sitter-make python-lsp-tree-sitter)
optdepends=(autoconf automake)
makedepends=(python-installer)
license=(GPL3)
_py=py3
source=("https://files.pythonhosted.org/packages/$_py/${pkgname::1}/${pkgname//-/_}/${pkgname//-/_}-$pkgver-$_py-none-any.whl")
sha256sums=('15359f601a686df69566f3d57279fe18c369fbb6d29705b24992dd5558683192')

package() {
	python -m installer -d "$pkgdir" ./*.whl
}
