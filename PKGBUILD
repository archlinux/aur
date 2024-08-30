# Maintainer: Michael Yeatts <mwyeatts at gmail dot com>

pkgname=python-mnemonic
pkgver=0.21
pkgrel=1
pkgdesc="Implementation of Bitcoin BIP-0039"
arch=('any')
depends=('python')
makedepends=('python-poetry')
url="https://github.com/trezor/python-mnemonic"
license=('MIT')
source=("https://files.pythonhosted.org/packages/ff/77/e6232ed59fbd7b90208bb8d4f89ed5aabcf30a524bc2fb8f0dafbe8e7df9/mnemonic-0.21.tar.gz")
sha256sums=('1fe496356820984f45559b1540c80ff10de448368929b9c60a2b55744cc88acf')

build() {
    cd "${pkgname#python-}-$pkgver"
    poetry build
}

package() {
    cd "${pkgname#python-}-$pkgver"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
