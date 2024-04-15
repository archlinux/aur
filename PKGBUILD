# Maintainer: darkgeem <darkgeem at pyrokinesis dot fr>

_name=owega
pkgname="python-$_name"
pkgver=5.5.5
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
	'python-markdownify'
)
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
b2sums=('9bd633488d4a16a58d06916dc5cf0e4f88e9dcef9fe1a7bd3a72c5e4079523c85d99459935f92f6abbbb3f19cc28fda4c21cf42db578c869282516a8ae068d65')

build() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
