# Maintainer: darkgeem <darkgeem at pyrokinesis dot fr>

_name=owega
pkgname="python-$_name"
pkgver=5.6.2
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
b2sums=('6a957027c4c5c25c1e8a23a6c7979cad9c46630539c17cfa5c11a596a0b85f11a51e5f3d2cefe12587cd516f818c435201fdbf59b1b664c5ef37b756aef7cb0d')

build() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
