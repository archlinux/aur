# Maintainer: darkgeem <darkgeem at pyrokinesis dot fr>

_name=geemlib
pkgname="python-$_name"
pkgver=1.0.0
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
b2sums=('0b2386346e506889a87bbe3afa0218d2c17056f1b181ac77a748a9294ecb72ba1569eb7e06ea72dec3b575d1925a435f3846a2352edd19b6b6f3621ed88678c3')

build() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
