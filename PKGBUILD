# Maintainer: Giovanni Harting <539@idlegandalf.com>

pkgname=python-simple-pid
_name=${pkgname#python-}
pkgver=1.0.1
pkgrel=1
pkgdesc="A simple and easy to use PID controller in Python"
arch=('any')
url="https://github.com/m-lundberg/simple-pid"
license=('MIT')
depends=()
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/m-lundberg/$_name/archive/v$pkgver.tar.gz")
sha256sums=('babdf0e355eaf4188860d558d732f2723d0b6586d41f81c8eba8f442a748448a')

build() {
    cd $_name-$pkgver

    python setup.py build
}

package() {
    cd $_name-$pkgver

    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

