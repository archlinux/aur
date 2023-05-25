# shellcheck shell=bash disable=SC2034,SC2154
_pkgname=translate-shell
pkgname=python-$_pkgname
pkgver=0.0.26
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
	'python-pystardict>=0.5.0: offline dictionary'
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
sha256sums=('da0abf008488fc9cd55777fc7dd043a8ca18e679ab41ab47012b212fb4935388')

package() {
	cd "$srcdir" || return 1
	python -m installer --destdir="$pkgdir" ./*.whl
}
