# Maintainer:  Liu Zhe <cruise.pas@gmail.com>

pkgname=python-json-tricks
pkgver=3.15.3
pkgrel=1
pkgdesc="Extra features for Python's JSON"
arch=('any')
url='https://github.com/mverleg/pyjson_tricks'
license=('BSD')
depends=('python')
optdepends=('python-numpy' 'python-pandas' 'python-pytz')
makedepends=('python-setuptools')
source=("pyjson_tricks-$pkgver.tar.gz::https://github.com/mverleg/pyjson_tricks/archive/v$pkgver.tar.gz")
sha1sums=('aacc799ce391c0f31fc86268fb19eaab55e3cb2e')

build() {
    cd "$srcdir"/pyjson_tricks-$pkgver
    python setup.py build
}

package() {
    cd "$srcdir"/pyjson_tricks-$pkgver
    python setup.py install --skip-build -O1 --root="$pkgdir"
    install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
