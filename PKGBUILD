# Maintainer: darkgeem <darkgeem at pyrokinesis dot fr>

_name=owega
pkgname="python-$_name"
pkgver=5.21.1
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
b2sums=('da491055e41c95d384e8fe7261785293dc985158f21bd5bcc43ac35af8d1047ab60f57d50d0ddfbf3f15ab3f0655613687eba40349957d47898804815efe5f4c')

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
