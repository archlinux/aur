# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
# Updated by https://github.com/Freed-Wu/requirements-language-server/blob/main/.github/workflows/main.yml
_pkgname=requirements-language-server
pkgname="python-$_pkgname"
pkgver=0.1.0
pkgrel=1
pkgdesc="pip's requirements.txt language server"
arch=(any)
url=https://github.com/Freed-Wu/requirements-language-server
depends=(python-lsp-tree-sitter python-tree-sitter-requirements python-aiohttp python-pip)
makedepends=(python-installer)
license=(GPL3)
_py=py3
source=("https://files.pythonhosted.org/packages/$_py/${_pkgname::1}/${_pkgname//-/_}/${_pkgname//-/_}-$pkgver-$_py-none-any.whl")
sha256sums=('95526734f154ba7e913861dc31b825dd2869e6a6d6b4111571b918f113c90e62')

package() {
	python -m installer -d "$pkgdir" ./*.whl
}
