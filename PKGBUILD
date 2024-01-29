# Maintainer: darkgeem <darkgeem at pyrokinesis dot fr>

_name=owega
pkgname="python-$_name"
pkgver=5.0.0
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
b2sums=('eb87c172a5f2f99d56acd7c26beecee6c4822c1e4aff61f552e3572da87b164b6159d7e8fab7cbb1056fdc984649fdd83c41547c983234e055fa2bfb69a3f33e')

build() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
