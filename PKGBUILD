# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
# Updated by https://github.com/Freed-Wu/requirements-language-server/blob/main/.github/workflows/main.yml
_pkgname=requirements-language-server
pkgname="python-$_pkgname"
pkgver=0.0.7
pkgrel=1
pkgdesc="pip's requirements.txt language server"
arch=(any)
url=https://github.com/Freed-Wu/requirements-language-server
depends=(python-pygls python-platformdirs python-jinja pip-cache pip-tools python-tree-sitter-requirements)
makedepends=(python-installer)
license=(GPL3)
_py=py3
source=("https://files.pythonhosted.org/packages/$_py/${_pkgname::1}/${_pkgname//-/_}/${_pkgname//-/_}-$pkgver-$_py-none-any.whl")
sha256sums=('04f261fe136abc427cda83a07e447e164595c424ac84f0d7d5b8a52a9c865733')

package() {
	python -m installer -d "$pkgdir" ./*.whl
}
