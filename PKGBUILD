# shellcheck shell=bash disable=SC2034,SC2154
_pkgname=tree-sitter-make
pkgname=python-$_pkgname
pkgver=0.0.1
pkgrel=1
pkgdesc="make grammar for tree-sitter"
arch=(i686 x86_64 arm aarch64)
url=https://github.com/tree-sitter-grammars/$_pkgname
depends=(python-tree-sitter)
makedepends=(python-installer)
license=(MIT)
_py="cp38"
_arch="$(uname -m)"
source=("https://files.pythonhosted.org/packages/$_py/${_pkgname::1}/${_pkgname//-/_}/${_pkgname//-/_}-$pkgver-$_py-abi3-manylinux_2_17_$_arch.whl")
sha256sums=('5923eeeaa98e486d3b4ee0819f3eb905cec9cef1e0d3f79626c2c981a003a66e')

package() {
	python -minstaller -d"$pkgdir" ./*.whl
}
