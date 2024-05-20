# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
# Updated by https://github.com/Freed-Wu/tree-sitter-bash/blob/main/.github/workflows/main.yml
_pkgname=tree-sitter-bash
pkgname=python-$_pkgname
pkgver=0.21.0
pkgrel=1
pkgdesc="bash grammar for tree-sitter"
arch=(i686 x86_64 arm aarch64)
url=https://github.com/Freed-Wu/$_pkgname
depends=(python-tree-sitter)
makedepends=(python-installer)
license=(MIT)
_py="cp38"
_arch="$(uname -m)"
source=("https://files.pythonhosted.org/packages/$_py/${_pkgname::1}/${_pkgname//-/_}/${_pkgname//-/_}-$pkgver-$_py-abi3-manylinux_2_17_$_arch.manylinux2014_$_arch.whl")
sha256sums=('b3f9bb54ce704abf822e44bdf67b3e7b402ea92c74b82fda24f32d04483734f8')

package() {
	python -minstaller -d"$pkgdir" ./*.whl
}
