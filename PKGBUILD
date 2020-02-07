# Maintainer: Giovanni Harting <539@idlegandalf.com>

pkgname=python-simple-pid
_name=${pkgname#python-}
pkgver=0.2.4
pkgrel=1
pkgdesc="A simple and easy to use PID controller in Python"
arch=('any')
url="https://github.com/m-lundberg/simple-pid"
license=('MIT')
depends=()
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/m-lundberg/$_name/archive/v$pkgver.tar.gz")
sha256sums=('441150075c846460acd38eeb232bab1ac75194f851237f0459307217e4a57525')

build() {
    cd $_name-$pkgver

    python setup.py build
}

package() {
    cd $_name-$pkgver

    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

