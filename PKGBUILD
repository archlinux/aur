# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
# Updated by https://github.com/neomutt/tree-sitter-muttrc/blob/main/.github/workflows/main.yml
_pkgname=tree-sitter-muttrc
pkgname=python-$_pkgname
pkgver=0.0.4
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
sha256sums=('26e329808f2231b34429cb4efbff49817c9ee7d6e20b4dd99ce5b376030bf82e')

package() {
	python -minstaller -d"$pkgdir" ./*.whl
}
