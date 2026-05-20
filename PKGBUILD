# Maintainer: ParticleG <particle_g at outlook dot com>
pkgname=gpu-select
pkgver=0.1.0
pkgrel=1
pkgdesc="Per-app GPU selection tool for Linux hybrid GPU laptops"
arch=('any')
url="https://github.com/ParticleG/gpu-select"
license=('MIT')
depends=('python>=3.11' 'python-tomlkit' 'switcheroo-control')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
