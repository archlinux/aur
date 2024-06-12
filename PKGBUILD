# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
# Updated by https://github.com/Freed-Wu/zathura-language-server/blob/main/.github/workflows/main.yml
pkgname=zathura-language-server
pkgver=0.0.13
pkgrel=1
pkgdesc="zathura's language server"
arch=(any)
url=https://github.com/Freed-Wu/zathura-language-server
depends=(python-lsp-tree-sitter 'python-tree-sitter-zathurarc>=0.0.4' python-webcolors)
makedepends=(python-installer)
license=(GPL3)
_py=py3
source=("https://files.pythonhosted.org/packages/$_py/${pkgname::1}/${pkgname//-/_}/${pkgname//-/_}-$pkgver-$_py-none-any.whl")
sha256sums=('17f29fb8a5f26f0cdaf49930cc2bb4b0d4d11637b10c45ce182aff5649a241b6')

package() {
	python -m installer -d "$pkgdir" ./*.whl
}
