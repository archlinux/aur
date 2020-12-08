# Maintainer: Michael Yeatts <mwyeatts at gmail dot com>

pkgname=python-mnemonic
pkgver=0.19
pkgrel=2
pkgdesc="Implementation of Bitcoin BIP-0039"
arch=('any')
depends=('python' 'python-pbkdf2')
makedepends=('python-setuptools')
url="https://github.com/trezor/python-mnemonic"
license=('MIT')
source=("https://files.pythonhosted.org/packages/80/0d/63de5efd5585fd6eb79eb35d3feb91deee8003e60997d61e3759eaf1ea66/mnemonic-0.19.tar.gz")
sha256sums=('4e37eb02b2cbd56a0079cabe58a6da93e60e3e4d6e757a586d9f23d96abea931')

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
