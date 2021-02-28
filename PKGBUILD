# Maintainer: Benoît Allard <benoit.allard@gnx.de>
pkgname=python-stable-baselines
pkgver=2.10.1
pkgrel=1
pkgdesc="A fork of OpenAI Baselines, implementations of reinforcement learning algorithms"
arch=('any')
url="https://github.com/hill-a/stable-baselines"
license=('MIT')
depends=("python")
optdepends=('openmpi: MPI support')
_name=${pkgname#python-}
source=("$pkgname-$pkgver.tar.gz::https://github.com/hill-a/$_name/archive/v$pkgver.tar.gz")
md5sums=('97472fbbd2c64c85f195bb49109ba81b')

build() {
    cd $_name-$pkgver
    export PYTHONSEED=1
    python setup.py build
}

package() {
    cd $_name-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
