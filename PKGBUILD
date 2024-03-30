# Maintainer: darkgeem <darkgeem at pyrokinesis dot fr>

_name=geemlib
pkgname="python-$_name"
pkgver=1.0.2
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
b2sums=('6c859c72d4c4b676d06a71459b96f83d56b48ad7a3a13ea0c215d76e458820bc2ddd4b74817814b06c2c8f9e9885e2c837da397335fa096a7b21d0067b10c356')

build() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
