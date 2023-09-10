# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
# Updated by https://github.com/Freed-Wu/bitbake-language-server/blob/main/.github/workflows/main.yml
pkgname=bitbake-language-server
pkgver=0.0.5
pkgrel=1
pkgdesc="bitbake language server"
arch=(any)
url=https://github.com/Freed-Wu/bitbake-language-server
depends=(python-pygls python-platformdirs python-tree-sitter)
optdepends=(bitbake)
makedepends=(python-installer)
license=(GPL3)
_py=cp310
source=("https://files.pythonhosted.org/packages/$_py/${pkgname::1}/${pkgname//-/_}/${pkgname//-/_}-$pkgver-$_py-$_py-manylinux_2_17_x86_64.manylinux_2_5_x86_64.manylinux1_x86_64.manylinux2014_x86_64.whl")
sha256sums=('b34994b727a647fa9f01b6cf64fd60a49cb4e94f5bd9043da7a8822f83e1ae15')

package() {
	python -m installer -d "$pkgdir" ./*.whl
}
