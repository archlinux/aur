# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
# Updated by https://github.com/wakatime/repl-python-wakatime/blob/main/.github/workflows/main.yml
_pkgname=repl-python-wakatime
pkgname=python-$_pkgname
pkgver=0.0.7
pkgrel=1
pkgdesc="Python REPL plugin for automatic time tracking and metrics generated from your programming activity"
arch=(any)
url=https://github.com/wakatime/repl-python-wakatime
makedepends=(python-installer)
optdepends=(
	'python-keyring: support codestats'
	'wakatime: support wakatime'
	'ptpython: support ptpython'
	'ipython: support ipython'
)
license=(GPLv3)
_py=py3
source=(
	"https://files.pythonhosted.org/packages/$_py/${_pkgname:0:1}/$_pkgname/${_pkgname//-/_}-$pkgver-$_py-none-any.whl"
)
sha256sums=('95fd881f777d70de324ad7f7ed39223461d7aed5941848bc258af71c38adda49')

package() {
	cd "$srcdir" || return 1
	python -m installer --destdir="$pkgdir" ./*.whl
}
