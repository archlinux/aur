# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
# Updated by https://github.com/sphinxcontrib/autofile/blob/main/.github/workflows/main.yml
_pkgname=sphinxcontrib-autofile
pkgname=python-$_pkgname
pkgver=0.0.1
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
sha256sums=('665045b18e2a6da0270686b044ebf522cb6c03f2e11ead505579aebd6b0c5a4f')

package() {
	cd "$srcdir" || return 1
	python -m installer --destdir="$pkgdir" ./*.whl
}
