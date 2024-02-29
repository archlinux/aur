# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
# Updated by https://github.com/Freed-Wu/requirements-language-server/blob/main/.github/workflows/main.yml
pkgname=requirements-language-server
pkgver=0.0.4
pkgrel=1
pkgdesc="pip's requirements.txt language server"
arch=(any)
url=https://github.com/Freed-Wu/requirements-language-server
depends=(python-aiohttp python-python-platformdirs python-lsp-tree-sitter python-python-tree-sitter-requirements)
makedepends=(python-installer)
license=(GPL3)
_py=py3
source=("https://files.pythonhosted.org/packages/$_py/${pkgname::1}/${pkgname//-/_}/${pkgname//-/_}-$pkgver-$_py-none-any.whl")
sha256sums=('b29b4861c432ad5f1d8c9a19d5e285e6077c37de3972f8384c8b782cd4f7f2ac')

package() {
	python -m installer -d "$pkgdir" ./*.whl
}
