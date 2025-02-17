# Maintainer: Ginés Guerrero <gmortir@gmail.com>
# Contributor: Marco Rubin <marco.rubin@protonmail.com>
# Contributor: Lukas Zimmermann <luk.zim91 at gmail dot com>
# Contributor: Kelsey Maes <kelseymaes at outlook dot com>

_name=scp.py
pkgname=python-scp
pkgver=0.15.0
pkgrel=1
pkgdesc="scp module for paramiko"
arch=('any')
url="https://github.com/jbardin/scp.py"
license=('LGPL')
depends=(python-paramiko)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=("$url/archive/v$pkgver.tar.gz")
b2sums=('f6916125e6a326423eaffefc88bc202b1e7ef023ecb07c8624c3f241ed90d19a7c6532815c1e8318d09a2846eb645e86b4c4a20f7090d3c4cb9a72c12be818ea')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}

