# Maintainer: Marco Rubin <marco.rubin@protonmail.com>
# Contributor: Lukas Zimmermann <luk.zim91 at gmail dot com>
# Contributor: Kelsey Maes <kelseymaes at outlook dot com>

_name=scp.py
pkgname=python-scp
pkgver=0.14.5
pkgrel=1
pkgdesc="scp module for paramiko"
arch=('any')
url="https://github.com/jbardin/scp.py"
license=('LGPL')
depends=(python-paramiko)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=("$url/archive/v$pkgver.tar.gz")
b2sums=('5b4ec2ee36f8260e9db2056582f1f959e86ed4a92c2a76432d39f6d38b6fac3aae68c6a02615ce362e8c28b6a998696f4ec9adf298efcd50f705ed425fbc52e0')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}

