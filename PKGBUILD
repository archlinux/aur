# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
# Updated by https://github.com/Freed-Wu/autotools-language-server/blob/main/.github/workflows/main.yml
pkgname=autotools-language-server
pkgver=0.0.9
pkgrel=1
pkgdesc="autotools language server"
arch=(any)
url=https://github.com/Freed-Wu/autotools-language-server
depends=(python-pygls python-platformdirs python-tree-sitter)
optdepends=(autotools)
makedepends=(python-installer)
license=(GPL3)
_py=cp310
source=("https://files.pythonhosted.org/packages/$_py/${pkgname::1}/${pkgname//-/_}/${pkgname//-/_}-$pkgver-$_py-$_py-manylinux_2_37_x86_64.whl")
sha256sums=('1817db9857e10ddf5ecc43b6d5774194ea643ebee7338233fd01bbd8152c6621')

package() {
	python -m installer -d "$pkgdir" ./*.whl
}
