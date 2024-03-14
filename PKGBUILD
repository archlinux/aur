# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
# Updated by https://github.com/Freed-Wu/tmux-language-server/blob/main/.github/workflows/main.yml
pkgname=tmux-language-server
pkgver=0.0.8
pkgrel=1
pkgdesc="tmux's language server"
arch=(any)
url=https://github.com/Freed-Wu/tmux-language-server
depends=(python-lsp-tree-sitter python-tree-sitter-tmux)
makedepends=(python-installer)
license=(GPL3)
_py=py3
source=("https://files.pythonhosted.org/packages/$_py/${pkgname::1}/${pkgname//-/_}/${pkgname//-/_}-$pkgver-$_py-none-any.whl")
sha256sums=('9a1cdd107224b77ae4cfe086be4acd509fe89ff7d7243e295cf889da5b995da0')

package() {
	python -m installer -d "$pkgdir" ./*.whl
}
