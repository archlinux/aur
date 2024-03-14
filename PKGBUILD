# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
# Updated by https://github.com/Freed-Wu/zathura-language-server/blob/main/.github/workflows/main.yml
pkgname=zathura-language-server
pkgver=0.0.11
pkgrel=1
pkgdesc="zathura's language server"
arch=(any)
url=https://github.com/Freed-Wu/zathura-language-server
depends=(python-lsp-tree-sitter 'python-tree-sitter-zathurarc>=0.0.3' python-webcolors)
makedepends=(python-installer)
license=(GPL3)
_py=py3
source=("https://files.pythonhosted.org/packages/$_py/${pkgname::1}/${pkgname//-/_}/${pkgname//-/_}-$pkgver-$_py-none-any.whl")
sha256sums=('6cdd977871ca70e0e031f567f90c150b08f866fffd775b3332b413f63ac6fdc7')

package() {
	python -m installer -d "$pkgdir" ./*.whl
}
