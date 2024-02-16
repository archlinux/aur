# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
# Updated by https://github.com/Freed-Wu/autotools-language-server/blob/main/.github/workflows/main.yml
pkgname=autotools-language-server
pkgver=0.0.14
pkgrel=1
pkgdesc="autotools language server"
arch=(any)
url=https://github.com/Freed-Wu/autotools-language-server
depends=(python-tree-sitter-languages python-tree-sitter-lsp)
optdepends=(autoconf automake)
makedepends=(python-installer)
license=(GPL3)
_py=py3
source=("https://files.pythonhosted.org/packages/$_py/${pkgname::1}/${pkgname//-/_}/${pkgname//-/_}-$pkgver-$_py-none-any.whl")
sha256sums=('3aa6d1b4bd1f3971e8a001e687c08dc9e1a8791e3ad23fe5cc55a89b16b80590')

package() {
	python -m installer -d "$pkgdir" ./*.whl
}
