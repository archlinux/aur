# shellcheck shell=bash disable=SC2034,SC2154
_pkgname=translate-shell
pkgname=python-$_pkgname
pkgver=0.0.35
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
	'python-pystardict: offline dictionary'
	'python-py-notifier>=0.5.0: GUI notification'
	'xsel: clipboard support'
	'xclip: clipboard support'
	'wl-clipboard: clipboard support'
	'lemonade: clipboard support'
	'doit: clipboard support'
	'tmux: clipboard support'
	'cygutils: clipboard support for Msys2'
	'espeak-ng: speaker support'
	'festival: speaker support'
	'python-pygls: LSP support'
	"python-jinja2: customize LLM prompt template"
	"python-openai: translate by openai's LLMs"
	"python-llama-cpp: translate by LLaMa"
	'stardict-ecdict: translate English to Chinese'
	'stardict-langdao-ec-gb: translate English to Chinese'
	'stardict-langdao-ce-gb: translate Chinese to English'
	'stardict-jmdict-en-ja: translate English to Japanese'
	'stardict-jmdict-ja-en: translate Japanese to English'
)
provides=(stardict)
conflicts=("$_pkgname")
license=(GPL3)
_py=py3
source=("https://files.pythonhosted.org/packages/$_py/${_pkgname::1}/$_pkgname/${_pkgname//-/_}-$pkgver-$_py-none-any.whl")
sha256sums=('f598f1e71fb37ea7dcb52fe113eeb27c29d667aeaef7b18e49dd98b62e8ac77e')

package() {
	python -m installer --destdir="$pkgdir" ./*.whl
}
