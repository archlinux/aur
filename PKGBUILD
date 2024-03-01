# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
# Updated by https://github.com/Freed-Wu/bitbake-language-server/blob/main/.github/workflows/main.yml
pkgname="bitbake-language-server"
pkgver=0.0.8
pkgrel=1
pkgdesc="bitbake language server"
arch=(any)
url=https://github.com/Freed-Wu/bitbake-language-server
depends=(python-pygls 'oelint-adv>=4.4.1')
makedepends=(python-installer)
license=(GPL3)
_py=py3
source=("https://files.pythonhosted.org/packages/$_py/${pkgname::1}/${pkgname//-/_}/${pkgname//-/_}-$pkgver-$_py-none-any.whl")
sha256sums=('954d2f8894bde825ace9490be96722d42f49df2a5aacc370ba1fcdf786ea1cc8')

package() {
	python -m installer -d "$pkgdir" ./*.whl
}
