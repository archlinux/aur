# Maintainer: Benoît Allard <benoit.allard@gnx.de>
pkgname=python-stable-baselines3
pkgver=1.0
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
md5sums=('87c82d1897baf60c873a3828e559521a')

build() {
    cd $_name-$pkgver
    export PYTHONSEED=1
    python setup.py build
}

package() {
    cd $_name-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
