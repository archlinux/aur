# Maintainer: Giovanni Harting <539@idlegandalf.com>

pkgname=python-simple-pid
_name=${pkgname#python-}
pkgver=0.2.3
pkgrel=1
pkgdesc="A simple and easy to use PID controller in Python"
arch=('any')
url="https://github.com/m-lundberg/simple-pid"
license=('MIT')
depends=()
makedepends=('python-setuptools')
source=("https://github.com/m-lundberg/$_name/archive/v$pkgver.tar.gz")
sha256sums=('385a0bae51525d1c0f132a12d385bdce0e604afb819c23fc3ad3088d72822147')

build() {
    cd $_name-$pkgver

    python setup.py build
}

package() {
    cd $_name-$pkgver

    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

