# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
# Updated by https://github.com/Freed-Wu/bitbake-language-server/blob/main/.github/workflows/main.yml
pkgname="bitbake-language-server"
pkgver=0.0.11
pkgrel=1
pkgdesc="bitbake language server"
arch=(any)
url=https://github.com/Freed-Wu/bitbake-language-server
depends=(python-pygls 'oelint-adv>=4.4.1')
makedepends=(python-installer)
license=(GPL3)
_py=py3
source=("https://files.pythonhosted.org/packages/$_py/${pkgname::1}/${pkgname//-/_}/${pkgname//-/_}-$pkgver-$_py-none-any.whl")
sha256sums=('6f94b9dd4aa00fda9f676ec9fd5e64e2840634e62d3cdfe0af63b9998c77e955')

package() {
	python -m installer -d "$pkgdir" ./*.whl
}
