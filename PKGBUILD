# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
# Updated by https://github.com/Freed-Wu/bitbake-language-server/blob/main/.github/workflows/main.yml
pkgname=bitbake-language-server
pkgver=0.0.6
pkgrel=1
pkgdesc="bitbake language server"
arch=(any)
url=https://github.com/Freed-Wu/bitbake-language-server
depends=(python-pygls python-oelint-parser)
makedepends=(python-installer)
license=(GPL3)
_py=cp310
source=("https://files.pythonhosted.org/packages/$_py/${pkgname::1}/${pkgname//-/_}/${pkgname//-/_}-$pkgver-$_py-$_py-manylinux_2_17_x86_64.manylinux_2_5_x86_64.manylinux1_x86_64.manylinux2014_x86_64.whl")
sha256sums=('4adccebbca07719c94f6aa423bf79c9d72a74169e1a83f020ca15b2497637213')

package() {
	python -m installer -d "$pkgdir" ./*.whl
}
