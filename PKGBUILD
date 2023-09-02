# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
# Updated by https://github.com/sphinxcontrib/autofile/blob/main/.github/workflows/main.yml
_pkgname=sphinxcontrib-autofile
pkgname=python-$_pkgname
pkgver=0.0.2
pkgrel=1
pkgdesc="autofileuate shell command or python code in sphinx and myst"
arch=(any)
url=https://github.com/sphinxcontrib/autofile
makedepends=(python-installer)
depends=(python-sphinx)
optdepends=('python-myst-parser: myst support')
conflicts=("$_pkgname")
license=(GPLv3)
_py=py3
source=(
	"https://files.pythonhosted.org/packages/$_py/${_pkgname:0:1}/$_pkgname/${_pkgname//-/_}-$pkgver-$_py-none-any.whl"
)
sha256sums=('b5d3df354080de635e41f57247829b01097be74e44f4fcd0ebe0f9b3a981a00f')

package() {
	cd "$srcdir" || return 1
	python -m installer --destdir="$pkgdir" ./*.whl
}
