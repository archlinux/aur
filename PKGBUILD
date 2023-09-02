# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
# Updated by https://github.com/sphinxcontrib/requirements-txt/blob/main/.github/workflows/main.yml
_pkgname=sphinxcontrib-requirements-txt
pkgname=python-$_pkgname
pkgver=0.0.0
pkgrel=1
pkgdesc="A sphinx extension to generate a rst/markdown to display the dependencies of a python package from requirement.txt"
arch=(any)
url=https://github.com/sphinxcontrib/requirements-txt
makedepends=(python-installer)
depends=(python-sphinx python-myst-parser)
license=(GPLv3)
_py=py3
source=(
	"https://files.pythonhosted.org/packages/$_py/${_pkgname:0:1}/$_pkgname/${_pkgname//-/_}-$pkgver-$_py-none-any.whl"
)
sha256sums=('c9fb71dc1901039378b0ee5a12ac74c2140a458cd2ac7a5b18ad8a344caf5505')

package() {
	cd "$srcdir" || return 1
	python -m installer --destdir="$pkgdir" ./*.whl
}
