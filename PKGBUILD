# Maintainer: Duncan X Simpson <duncan@k7dxs.net>

pkgname=python-unpaddedbase32
pkgver=0.1.0
pkgrel=1
pkgdesc="A library to use base32 without padding in Python"
arch=('any')
depends=('python')
makedepends=('python-setuptools')
url="https://github.com/beardog108/python-unpaddedbase32"
license=('GPL3')
source=("https://files.pythonhosted.org/packages/b7/91/581a95d8ebd42000a962832999b933a1b3f3a904b30fae2c1c2b3abc958a/unpaddedbase32-0.1.0.tar.gz")
md5sums=('19045dd217804ac4b20a7cc666b21ab8')

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
