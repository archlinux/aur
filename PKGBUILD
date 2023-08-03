# Maintainer: Benoît Allard <benoit.allard@gnx.de>
pkgname=python-cmaes
pkgver=0.10.0
pkgrel=1
pkgdesc="Lightweight Covariance Matrix Adaptation Evolution Strategy (CMA-ES) implementation for Python 3"
arch=('any')
url="https://github.com/CyberAgent/cmaes"
license=('MIT')
depends=("python" "python-numpy")
makedepends=("python-wheel")
_name=${pkgname#python-}
source=("$pkgname-$pkgver.tar.gz::https://github.com/CyberAgent/$_name/archive/v$pkgver.tar.gz")
sha256sums=('d6a5b8e7a25390ba1f83d6426a1f79d9ba3d46d3d82f79e0fb945668f51af1b1')

build() {
    cd $_name-$pkgver
    export PYTHONSEED=1
    python setup.py build
}

package() {
    cd $_name-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
