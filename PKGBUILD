# Maintainer: Benoît Allard <benoit.allard@gmx.de>
pkgname=python-stable-baselines3
pkgver=1.3.0
pkgrel=1
pkgdesc="A set of reliable implementations of reinforcement learning algorithms in PyTorch"
arch=('any')
url="https://github.com/DLR-RM/stable-baselines3"
license=('MIT')
depends=("python" "python-gym" "python-numpy" "python-pytorch" "python-cloudpickle" "python-pandas" "python-matplotlib")
optdepends=('python-opencv: For render'
    'python-atari-py: For atari games'
    'python-pillow: For atari games'
    'tensorboard: Tensorboard support'
    'python-psutil: Checking memory taken by replay buffer')
_name=${pkgname#python-}
source=("$pkgname-$pkgver.tar.gz::https://github.com/DLR-RM/$_name/archive/v$pkgver.tar.gz")
md5sums=('537cce8acda5b095365021f442954944')

build() {
    cd $_name-$pkgver
    export PYTHONSEED=1
    python setup.py build
}

package() {
    cd $_name-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
