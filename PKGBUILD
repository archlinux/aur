# Maintainer: Benoît Allard <benoit.allard@gmx.de>
pkgname=python-stable-baselines3-contrib
pkgver=2.7.1
pkgrel=1
pkgdesc="Contrib package of Stable Baselines3, experimental code."
arch=('any')
url="https://sb3-contrib.readthedocs.io"
license=('MIT')
makedepends=('python-build' 'python-installer' 'python-setuptools')
depends=("python" "python-stable-baselines3")
_name=${pkgname#python-}
source=("$pkgname-$pkgver.tar.gz::https://github.com/Stable-Baselines-Team/$_name/archive/v$pkgver.tar.gz")
sha256sums=('f1ccbb48801a752e478c96160430ecf056c9d6396663ac097ab07a308e32b127')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir "$pkgdir" dist/*.whl
}
