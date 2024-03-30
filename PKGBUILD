# Maintainer: darkgeem <darkgeem at pyrokinesis dot fr>

_name=geemlib
pkgname="python-$_name"
pkgver=1.0.1
pkgrel=1
pkgdesc="TUI / CLI interface for conversing with GPT models (from OpenAI)"
arch=('any')
url="https://pypi.org/project/geemlib/"
license=('custom:WTFPL')
depends=(
    'python'
    'python-beautifulsoup4'
    'python-requests'
)
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
b2sums=('f34390b8e5940b451cb63a26eed9b31fac45b458cb0aab9a8c5e26f85174f34bca47342083a581856244c4d83380d5741634be670e08a76a3ab273cc5cae2ef3')

build() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
