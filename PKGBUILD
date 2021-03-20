# Maintainer: Benoît Allard <benoit.allard@gnx.de>
pkgname=python-stable-baselines3-contrib
pkgver=1.0
pkgrel=1
pkgdesc="Contrib package of Stable Baselines3, experimental code."
arch=('any')
url="https://sb3-contrib.readthedocs.io"
license=('MIT')
depends=("python" "python-stable-baselines3")
_name=${pkgname#python-}
source=("$pkgname-$pkgver.tar.gz::https://github.com/Stable-Baselines-Team/$_name/archive/v$pkgver.tar.gz")
md5sums=('b156f5b2a6da12dc51e8c7c31871dc5a')

build() {
    cd $_name-$pkgver
    export PYTHONSEED=1
    python setup.py build
}

package() {
    cd $_name-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
