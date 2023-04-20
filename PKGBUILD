# shellcheck shell=bash disable=SC2034,SC2154
_pkgname=translate-shell
pkgname=python-$_pkgname
pkgver=0.0.24
pkgrel=2
pkgdesc="Translate text by google, bing, youdaozhiyun, haici, stardict, etc at same time from CLI, GUI (GNU/Linux, Android, macOS and Windows), REPL, python, shell and vim."
arch=(any)
url=https://github.com/Freed-Wu/translate-shell
makedepends=(python-installer)
optdepends=(
	'python-repl-python-wakatime: wakatime support'
	'python-colorama: color support'
	'python-rich: better logger'
	'python-yaml: output yaml format'
	'python-keyring: store APP secrets securely'
	'python-langdetect: detect language automatically for offline dictionary'
	'python-pystardict: offline dictionary'
	'python-py-notifier: GUI notification'
	'xsel: clipboard support'
	'xclip: clipboard support'
	'espeak-ng: speaker support'
	'festival: speaker support'
)
conflicts=("$_pkgname")
license=(GPL3)
source=(
	"$url/releases/download/$pkgver/${_pkgname//-/_}-$pkgver-py3-none-any.whl"
)
sha256sums=('7b8724c2cbdd0ab7809b51b743cef3fc7009539cac6c6dab91b4060d98019abf')

package() {
	cd "$srcdir" || return 1
	python -m installer --destdir="$pkgdir" ./*.whl
}
