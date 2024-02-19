# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
# Updated by https://github.com/Freed-Wu/tree-sitter-tmux/blob/main/.github/workflows/main.yml
_pkgname=tree-sitter-tmux
pkgname=python-$_pkgname
pkgver=0.0.1
pkgrel=1
pkgdesc="tmux grammar for tree-sitter"
arch=(i686 x86_64 arm aarch64)
url=https://github.com/Freed-Wu/$_pkgname
depends=(python-tree-sitter)
makedepends=(python-installer)
license=(GPL3)
_py="cp$(python -c'import sys; print(f"{sys.version_info.major}{sys.version_info.minor}")' || echo 311)"
source=("https://files.pythonhosted.org/packages/$_py/${_pkgname::1}/${_pkgname//-/_}/${_pkgname//-/_}-$pkgver-$_py-$_py-manylinux_2_17_x86_64.manylinux_2_5_x86_64.manylinux1_x86_64.manylinux2014_x86_64.whl")
sha256sums=('c39db4855d6887136303aabd375b87b15658c781735911ab6774b15fd7226d5d')

package() {
	python -minstaller -d"$pkgdir" ./*.whl
}
