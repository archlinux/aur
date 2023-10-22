# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
# Updated by https://github.com/Freed-Wu/pkgbuild-language-server/blob/main/.github/workflows/main.yml
pkgname=pkgbuild-language-server
pkgver=0.0.6
pkgrel=1
pkgdesc="Archlinux and Windows Msys2's PKGBUILD language server"
arch=(any)
url=https://github.com/Freed-Wu/pkgbuild-language-server
depends=(python-colorama python-jinja python-platformdirs python-pygls python-tree-sitter)
optdepends=(python-pypandoc python-markdown-it-py pacman pyalpm namcap)
makedepends=(python-installer)
license=(GPL3)
_py=py3
source=("https://files.pythonhosted.org/packages/$_py/${pkgname::1}/${pkgname//-/_}/${pkgname//-/_}-$pkgver-$_py-none-any.whl")
sha256sums=('db062b5028e93aa9304d2783cd73017320587ac64fc4d8c01f514ae1015a4bf0')

package() {
	python -m installer -d "$pkgdir" ./*.whl
}
