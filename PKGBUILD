# Maintainer: darkgeem <darkgeem at pyrokinesis dot fr>

_name=owega
pkgname="python-$_name"
pkgver=4.12.10
pkgrel=1
pkgdesc="TUI / CLI interface for conversing with GPT models (from OpenAI)"
arch=('any')
url="https://pypi.org/project/owega/"
license=('custom:WTFPL')
depends=(
    'python'
    'python-beautifulsoup4'
    'python-editor'
    'python-json5'
    'python-lxml'
    'python-openai'
    'python-prompt_toolkit'
    'python-pygame'
    'python-requests'
    'python-tiktoken'
)
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
b2sums=('a5d3ac8e70fc258b290ae341d7dbb5b6c4800395e74c8022e7a274b71f7c7ee2abe7ab4a881390fac4ec53bc43a16906d878b744080901f99f7f08675b68344e')

build() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
