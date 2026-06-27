# Maintainer: Benoît Allard <benoit.allard@gmx.de>
pkgname=python-stable-baselines3-contrib
pkgver=2.9.0
pkgrel=1
pkgdesc="Contrib package of Stable Baselines3, experimental code."
arch=('any')
url="https://sb3-contrib.readthedocs.io"
license=('MIT')
makedepends=('python-build' 'python-installer' 'python-setuptools')
depends=("python" "python-stable-baselines3")
_name=${pkgname#python-}
source=("$pkgname-$pkgver.tar.gz::https://github.com/Stable-Baselines-Team/$_name/archive/v$pkgver.tar.gz")
sha256sums=('e316fa029fb5fbabe9c532ef35bb184c166d44fb403762522dc843106be6e408')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir "$pkgdir" dist/*.whl
}
