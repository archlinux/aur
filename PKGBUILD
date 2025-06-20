# Maintainer: darkgeem <darkgeem at pyrokinesis dot fr>

_name=owega
pkgname="python-$_name"
pkgver=5.22.3
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
b2sums=('3aed0b4424276edc94f599c80f2426e7a9df14548bd0decc4a858f2fafeaf0e957e7a6abc765402611ecb12fb7f1e24c92e6f38373071f6e3cc0ad072fd8aeed')

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
