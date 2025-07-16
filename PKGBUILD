# Maintainer: darkgeem <darkgeem at pyrokinesis dot fr>

_name=owega
pkgname="python-$_name"
pkgver=5.23.1
pkgrel=1
pkgdesc="TUI / CLI interface for conversing with GPT models (from OpenAI and +)"
arch=('any')
url="https://pypi.org/project/owega/"
license=('custom:DGPL-1.0')
depends=(
    'python'
    'python-beautifulsoup4'
    'python-editor'
    'python-json5'
    'python-lxml'
    'python-openai'
    'python-prompt_toolkit'
    'python-requests'
    'python-setuptools'
)
makedepends=('python-setuptools')
optdepends=(
    'python-rich: fancy output print for TUI'
    'python-pygame: for TTS audio output'
    'python-markdownify: for better webpage handling (get_page function)'
    'python-tiktoken: better token estimation'
)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
b2sums=('a2f8c4f0a7d97bcf44c94208b63e9a32e78462a28c611c6a694731cde3bc2485483a15c860c723dc651818818520099bc060910b91a1330cea74c3d3484dbe43')

build() {
    cd "$srcdir/$_name-$pkgver"
	export PYTHONDONTWRITEBYTECODE=
	export PYTHONPYCACHEPREFIX=
    python setup.py build
}

package() {
    cd "$srcdir/$_name-$pkgver"
	export PYTHONDONTWRITEBYTECODE=
	export PYTHONPYCACHEPREFIX=
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
