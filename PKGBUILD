# Maintainer: Benoît Allard <benoit.allard@gnx.de>
pkgname=python-cmaes
pkgver=0.8.2
pkgrel=1
pkgdesc="Lightweight Covariance Matrix Adaptation Evolution Strategy (CMA-ES) implementation for Python 3"
arch=('any')
url="https://github.com/CyberAgent/cmaes"
license=('MIT')
depends=("python" "python-numpy")
makedepends=("python-wheel")
_name=${pkgname#python-}
source=("$pkgname-$pkgver.tar.gz::https://github.com/CyberAgent/$_name/archive/v$pkgver.tar.gz")
md5sums=('f577f39afd33693d660d47ebeda92880')

build() {
    cd $_name-$pkgver
    export PYTHONSEED=1
    python setup.py build
}

package() {
    cd $_name-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
