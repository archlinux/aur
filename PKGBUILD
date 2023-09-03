# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
# Updated by https://github.com/Freed-Wu/mutt-language-server/blob/main/.github/workflows/main.yml
pkgname=mutt-language-server
pkgver=0.0.1
pkgrel=1
pkgdesc="mutt/neomutt's language server"
arch=(any)
url=https://github.com/Freed-Wu/mutt-language-server
depends=(python-pygls python-platformdirs)
optdepends=(python-pypandoc python-markdown-it-py)
makedepends=(python-installer)
license=(GPL3)
_py=py3
source=("https://files.pythonhosted.org/packages/$_py/${pkgname::1}/${pkgname//-/_}/${pkgname//-/_}-$pkgver-$_py-none-any.whl")
sha256sums=('83f46c0413e6ef1280a0f25da4ef91fbd8bb9c56c6f4437826c8549a884c7ce5')

package() {
	python -m installer -d "$pkgdir" ./*.whl
}
