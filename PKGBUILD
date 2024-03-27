# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
# Updated by https://github.com/Freed-Wu/tree-sitter-tmux/blob/main/.github/workflows/main.yml
_pkgname=tree-sitter-tmux
pkgname=python-$_pkgname
pkgver=0.0.3
pkgrel=1
pkgdesc="tmux grammar for tree-sitter"
arch=(i686 x86_64 arm aarch64)
url=https://github.com/Freed-Wu/$_pkgname
depends=(python-tree-sitter)
makedepends=(python-installer)
license=(MIT)
_py="cp38"
_arch="$(uname -m)"
source=("https://files.pythonhosted.org/packages/$_py/${_pkgname::1}/${_pkgname//-/_}/${_pkgname//-/_}-$pkgver-$_py-abi3-manylinux_2_5_$_arch.manylinux1_$_arch.manylinux_2_17_$_arch.manylinux2014_$_arch.whl")
sha256sums=('e5c67b12ae405085ad6fe4c64cfa444d71d2a6e5742108eb8ff454dbe559c2df')

package() {
	python -minstaller -d"$pkgdir" ./*.whl
}
