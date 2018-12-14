# Maintainer: Michael Yeatts <mwyeatts at gmail dot com>

pkgname=python-mnemonic
pkgver=0.18
pkgrel=2
pkgdesc="Implementation of Bitcoin BIP-0039"
arch=('any')
depends=('python' 'python-pbkdf2')
makedepends=('python-setuptools')
url="https://github.com/trezor/python-mnemonic"
license=('MIT')
source=("https://pypi.python.org/packages/a4/5a/663362ccceb76035ad50fbc20203b6a4674be1fe434886b7407e79519c5e/mnemonic-0.18.tar.gz")
md5sums=('6c9bb3bcd75272450230da034851dfc6')

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
