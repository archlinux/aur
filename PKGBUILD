# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
# Updated by https://github.com/sphinxcontrib/requirements-txt/blob/main/.github/workflows/main.yml
_pkgname=sphinxcontrib-requirements-txt
pkgname=python-$_pkgname
pkgver=0.0.4
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
sha256sums=('b312e6ff740407c67b8d79d2b5dcbd8c9109d882bff1cb040e5f585303efd431')

package() {
	cd "$srcdir" || return 1
	python -m installer --destdir="$pkgdir" ./*.whl
}
