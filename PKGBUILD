# Maintainer: darkgeem <darkgeem at pyrokinesis dot fr>

_name=owega
pkgname="python-$_name"
pkgver=5.23.0
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
b2sums=('420e054b9eee6ffb3ed92f58eccaf281f240426173abfd0d2f989095e72937a34786e280b2ccfe10c07ad7bd96f0d074a4789ace53d5e6c6b371cf3d56fec9f9')

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
