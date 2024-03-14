# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
# Updated by https://github.com/Freed-Wu/requirements-language-server/blob/main/.github/workflows/main.yml
_pkgname=requirements-language-server
pkgname="python-$_pkgname"
pkgver=0.0.20
pkgrel=1
pkgdesc="pip's requirements.txt language server"
arch=(any)
url=https://github.com/Freed-Wu/requirements-language-server
depends=(python-lsp-tree-sitter python-tree-sitter-requirements python-aiohttp)
makedepends=(python-installer)
license=(GPL3)
_py=py3
source=("https://files.pythonhosted.org/packages/$_py/${_pkgname::1}/${_pkgname//-/_}/${_pkgname//-/_}-$pkgver-$_py-none-any.whl")
sha256sums=('01f1d36b2cf722215b04c66172d2a32e243a8f1374ce4003781fbe502bf39ada')

package() {
	python -m installer -d "$pkgdir" ./*.whl
}
