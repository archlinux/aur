# shellcheck shell=bash disable=SC2034,SC2154
_pkgname=translate-shell
pkgname=python-$_pkgname
pkgver=0.0.18
pkgrel=1
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
_py=py3
source=("https://files.pythonhosted.org/packages/$_py/${_pkgname::1}/$_pkgname/${_pkgname//-/_}-$pkgver-$_py-none-any.whl")
sha256sums=('5821b9842a7d35a6732da3420278bcab47e32de24032f2f8c8757e3ea80184f5')

package() {
	cd "$srcdir" || return 1
	python -m installer --destdir="$pkgdir" ./*.whl
}
