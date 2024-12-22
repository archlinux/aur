# shellcheck shell=bash disable=SC2034,SC2154
_pkgname=tree-sitter-make
pkgname=python-$_pkgname
pkgver=1.1.1
pkgrel=1
pkgdesc="make grammar for tree-sitter"
arch=(i686 x86_64 arm aarch64)
url=https://github.com/tree-sitter-grammars/$_pkgname
depends=(python-tree-sitter)
makedepends=(python-installer)
license=(MIT)
_py="cp39"
_arch="$(uname -m)"
source=("https://files.pythonhosted.org/packages/$_py/${_pkgname::1}/${_pkgname//-/_}/${_pkgname//-/_}-$pkgver-$_py-abi3-manylinux_2_5_$_arch.manylinux1_$_arch.manylinux_2_17_$_arch.manylinux2014_$_arch.whl")
sha256sums=('6e0e424449c9e0a2f7e8476238727638acb5fe041533440fc20e21e064ef1fb7')

package() {
	python -minstaller -d"$pkgdir" ./*.whl
}
