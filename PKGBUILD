# Maintainer: Benoît Allard <benoit.allard@gnx.de>
pkgname=python-cmaes
pkgver=0.9.1
pkgrel=1
pkgdesc="Lightweight Covariance Matrix Adaptation Evolution Strategy (CMA-ES) implementation for Python 3"
arch=('any')
url="https://github.com/CyberAgent/cmaes"
license=('MIT')
depends=("python" "python-numpy")
makedepends=("python-wheel")
_name=${pkgname#python-}
source=("$pkgname-$pkgver.tar.gz::https://github.com/CyberAgent/$_name/archive/v$pkgver.tar.gz")
sha256sums=('57c8d7805b175ef821fd1940c46c10ef13b16ae5fd3018ea9bf186b53e5c4d13')

build() {
    cd $_name-$pkgver
    export PYTHONSEED=1
    python setup.py build
}

package() {
    cd $_name-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
