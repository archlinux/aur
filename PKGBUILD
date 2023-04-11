# shellcheck shell=bash disable=SC2034,SC2154
_pkgname=repl-python-codestats
pkgname=python-$_pkgname
pkgver=0.0.6
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
sha256sums=('838fe8d7fdcbce57c091448432592f135187a166d09107cf8a9b13741ac429a0')

package() {
	cd "$srcdir" || return 1
	python -m installer --destdir="$pkgdir" ./*.whl
}
