# Maintainer: Benoît Allard <benoit.allard@gmx.de>
pkgname=python-stable-baselines3
pkgver=2.1.0
pkgrel=1
pkgdesc="A set of reliable implementations of reinforcement learning algorithms in PyTorch"
arch=('any')
url="https://github.com/DLR-RM/stable-baselines3"
license=('MIT')
depends=("python"
    "python-gymnasium"
    "python-numpy"
    "python-pytorch"
    "python-cloudpickle"
    "python-pandas"
    "python-matplotlib")
optdepends=('python-opencv: For render'
    'python-pygame: For render'
    'python-shimmy: For atari games'
    'python-pillow: For atari games'
    'tensorboard: Tensorboard support'
    'python-psutil: Checking memory taken by replay buffer'
    'python-tqdm: For progress bar callback'
    'python-rich: For progress bar callback')
_name=${pkgname#python-}
source=("$pkgname-$pkgver.tar.gz::https://github.com/DLR-RM/$_name/archive/v$pkgver.tar.gz")
sha256sums=('9d62ac964579194b89f0d876ee5dbd59589717c70531eb73a6ce62aa06caa6c5')

build() {
    cd $_name-$pkgver
    export PYTHONSEED=1
    python setup.py build
}

package() {
    cd $_name-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

