# Maintainer: Michael Yeatts <mwyeatts at gmail dot com>

pkgname=python-mnemonic
pkgver=0.20
pkgrel=2
pkgdesc="Implementation of Bitcoin BIP-0039"
arch=('any')
depends=('python')
makedepends=('python-setuptools')
url="https://github.com/trezor/python-mnemonic"
license=('MIT')
source=("https://files.pythonhosted.org/packages/f8/8d/d4dc2b2bddfeb57cab4404a41749b577f578f71140ab754da9afa8f5c599/mnemonic-0.20.tar.gz")
sha256sums=('7c6fb5639d779388027a77944680aee4870f0fcd09b1e42a5525ee2ce4c625f6')

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
