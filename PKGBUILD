# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
# Updated by https://github.com/Freed-Wu/translate-shell/blob/main/.github/workflows/main.yml
_pkgname=translate-shell
pkgname=python-$_pkgname
pkgver=0.0.43
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
	"python-jinja: customize LLM prompt template"
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
sha256sums=('e646ece67bb346ff115e28d61c5054653de8761c9d00a0469d888c3cbc2f4d72')

package() {
	python -m installer --destdir="$pkgdir" ./*.whl
}
