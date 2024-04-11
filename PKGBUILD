# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
# Updated by https://github.com/neomutt/tree-sitter-muttrc/blob/main/.github/workflows/main.yml
_pkgname=tree-sitter-muttrc
pkgname=python-$_pkgname
pkgver=0.0.5
pkgrel=1
pkgdesc="muttrc grammar for tree-sitter"
arch=(i686 x86_64 arm aarch64)
url=https://github.com/Freed-Wu/$_pkgname
depends=(python-tree-sitter)
makedepends=(python-installer)
license=(MIT)
_py="cp38"
_arch="$(uname -m)"
source=("https://files.pythonhosted.org/packages/$_py/${_pkgname::1}/${_pkgname//-/_}/${_pkgname//-/_}-$pkgver-$_py-abi3-manylinux_2_5_$_arch.manylinux1_$_arch.manylinux_2_17_$_arch.manylinux2014_$_arch.whl")
sha256sums=('4fabf9ab6cd6e8f77002ded4101ec893fb6080a0c7f09e3c44a4d9cc94f82d1c')

package() {
	python -minstaller -d"$pkgdir" ./*.whl
}
