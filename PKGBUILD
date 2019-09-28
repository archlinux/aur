# Maintainer: Duncan X Simpson <duncan@k7dxs.net>

pkgname=python-streamedrequests
pkgver=1.0.0
pkgrel=1
pkgdesc="A library for streaming http GET or POST requests' responses"
arch=('any')
depends=('python')
makedepends=('python-setuptools')
url="https://github.com/beardog108/streamedrequests"
license=('GPL3')
source=("https://files.pythonhosted.org/packages/91/af/673dde1d1bacac873197ce12405eaba5efe0b305e76b7b8fee58a05b5aba/streamedrequests-1.0.0.tar.gz")
md5sums=('40a48d25c8885d36baa4291f8b91e706')

build() {
    cd "$srcdir/${pkgname#python-}-$pkgver"

    msg2 'Building...'
    python setup.py build
}

package() {
    cd "$srcdir/${pkgname#python-}-$pkgver"

    msg2 'Installing...'
    python setup.py install --root="$pkgdir" --optimize=1
}
