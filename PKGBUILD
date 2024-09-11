# Maintainer: Phillip Davies <philliptdavies at gmail dot com>
pkgname=pros-cli
pkgver=3.5.4
pkgrel=1
pkgdesc="Command Line Interface for managing PROS projects. Works with V5 and the Cortex"
arch=('x86_64')
url="https://github.com/purduesigbots/pros-cli"
license=('MPL')
depends=('python-jsonpickle' 'python-sentry_sdk' 'python-semantic-version' 'python-requests-futures' 'python-pyserial' 'python-cobs' 'arm-none-eabi-newlib' 'arm-none-eabi-gcc')
makedepends=('python-build' 'python-installer' 'python-wheel')

build() {
    cd $pkgname-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
