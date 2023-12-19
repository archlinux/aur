# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
# Updated by https://github.com/Freed-Wu/requirements-language-server/blob/main/.github/workflows/main.yml
_pkgname=requirements-language-server
pkgname="python-$_pkgname"
pkgver=0.0.13
pkgrel=1
pkgdesc="pip's requirements.txt language server"
arch=(any)
url=https://github.com/Freed-Wu/requirements-language-server
depends=(python-tree-sitter-lsp python-tree-sitter-requirements python-aiohttp)
makedepends=(python-installer)
license=(GPL3)
_py=py3
source=("https://files.pythonhosted.org/packages/$_py/${_pkgname::1}/${_pkgname//-/_}/${_pkgname//-/_}-$pkgver-$_py-none-any.whl")
sha256sums=('26b38d0d90d1fecfd71313739731fb9a7fc718f24edbf92d107c7467d2450d53')

package() {
	python -m installer -d "$pkgdir" ./*.whl
}
