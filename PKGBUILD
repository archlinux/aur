# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
# Updated by https://github.com/Freed-Wu/termux-language-server/blob/main/.github/workflows/main.yml
pkgname=termux-language-server
pkgver=0.0.2
pkgrel=1
pkgdesc="termux's build.sh language server"
arch=(any)
url=https://github.com/termux/termux-language-server
depends=(python-colorama python-jinja python-platformdirs python-pygls python-tree-sitter python-fqdn python-rfc3987)
optdepends=(python-beautifulsoup4 python-pypandoc python-markdown-it-py)
makedepends=(python-installer)
license=(GPL3)
_py="cp$(python -c'import sys; print(f"{sys.version_info.major}{sys.version_info.minor}")')"
source=("https://files.pythonhosted.org/packages/$_py/${pkgname::1}/${pkgname//-/_}/${pkgname//-/_}-$pkgver-$_py-$_py-manylinux_2_17_x86_64.whl")
sha256sums=('a3569c2f1589710cb23ecdb9dfe382bb68be38008ce4fb46e37769015d58dbb6')

package() {
	python -m installer -d "$pkgdir" ./*.whl
}
