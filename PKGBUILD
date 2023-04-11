# shellcheck shell=bash disable=SC2034,SC2154
_pkgname=repl-python-codestats
pkgname=python-$_pkgname
pkgver=0.0.3
pkgrel=1
pkgdesc="A codestats plugin for python REPLs"
arch=(any)
url=https://github.com/Freed-Wu/repl-python-codestats
depends=(python-repl-python-wakatime)
makedepends=(python-installer)
optdepends=(
	'keyring: use keyring to restore API key'
	'ptpython: support ptpython'
	'ipython: support ipython'
)
license=(GPLv3)
_py=py3
source=(
	"$url/releases/download/$pkgver/${_pkgname//-/_}-$pkgver-py3-none-any.whl"
)
sha256sums=('b6fa1f0b76a9a9ba39e59b8d222e54da5c174c5d8ee6818b2f82bc21fa7c4ee9')

package() {
	cd "$srcdir" || return 1
	python -m installer --destdir="$pkgdir" ./*.whl
}
