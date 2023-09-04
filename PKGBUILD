# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
# Updated by https://github.com/Freed-Wu/mutt-language-server/blob/main/.github/workflows/main.yml
pkgname=mutt-language-server
pkgver=0.0.2
pkgrel=1
pkgdesc="mutt/neomutt's language server"
arch=(any)
url=https://github.com/Freed-Wu/mutt-language-server
depends=(python-pygls python-platformdirs)
optdepends=(python-pypandoc python-markdown-it-py mutt neomutt)
makedepends=(python-installer)
license=(GPL3)
_py=py3
source=("https://files.pythonhosted.org/packages/$_py/${pkgname::1}/${pkgname//-/_}/${pkgname//-/_}-$pkgver-$_py-none-any.whl")
sha256sums=('4c37929f26c1604428bc9091a0c2c7e7165791af83a4d9fb0b370d3ed19394eb')

package() {
	python -m installer -d "$pkgdir" ./*.whl
}
