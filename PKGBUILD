# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
# Updated by https://github.com/termux/termux-language-server/blob/main/.github/workflows/main.yml
pkgname=termux-language-server
pkgver=0.0.28
pkgrel=1
pkgdesc="Language server for build.sh, PKGBUILD, ebuild"
arch=(any)
url=https://github.com/termux/termux-language-server
provides=(pkgbuild-language-server portage-language-server)
conflicts=(pkgbuild-language-server portage-language-server)
replaces=(pkgbuild-language-server portage-language-server)
depends=(python-tree-sitter-bash python-platformdirs python-lsp-tree-sitter python-fqdn python-rfc3987 namcap pyalpm)
optdepends=(portage)
makedepends=(python-installer)
license=(GPL3)
_py=py3
source=("https://files.pythonhosted.org/packages/$_py/${pkgname::1}/${pkgname//-/_}/${pkgname//-/_}-$pkgver-$_py-none-any.whl")
sha256sums=('00193c908d37cee096af7c760bdbb5a4f2d2691cdd89724365ec302b9d9a820d')

package() {
	python -m installer -d "$pkgdir" ./*.whl
}
