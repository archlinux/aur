# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
# Updated by https://github.com/termux/termux-language-server/blob/main/.github/workflows/main.yml
pkgname=termux-language-server
pkgver=0.0.12
pkgrel=1
pkgdesc="Language server for build.sh, PKGBUILD, ebuild"
arch=(any)
url=https://github.com/termux/termux-language-server
provides=(pkgbuild-language-server portage-language-server)
conflicts=(pkgbuild-language-server portage-language-server)
replaces=(pkgbuild-language-server portage-language-server)
depends=(python-tree-sitter-languages python-platformdirs python-tree-sitter-lsp python-fqdn python-rfc3987 namcap pyalpm)
makedepends=(python-installer)
license=(GPL3)
_py=py3
source=("https://files.pythonhosted.org/packages/$_py/${pkgname::1}/${pkgname//-/_}/${pkgname//-/_}-$pkgver-$_py-none-any.whl")
sha256sums=('fae0d484a077e11f37bafce529a5ffe4351ca0ad565df33ad3518667a4851d39')

package() {
	python -m installer -d "$pkgdir" ./*.whl
}
