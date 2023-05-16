# Maintainer: Mario Ortiz Manero <marioortizmanero@gmail.com>
pkgname=python-tekore
pkgver=4.6.0
pkgrel=1
pkgdesc="Client for the Spotify Web API"
arch=("any")
url="https://github.com/felix-hilden/tekore"
license=("custom:MIT")
depends=("python>=3.7" "python-httpx>=0.15")
makedepends=("python-build" "python-installer" "python-wheel")
source=("https://github.com/felix-hilden/tekore/archive/v$pkgver.tar.gz")
md5sums=('36fc1e4d8c8b3602aabb3b5548e2208f')

prepare() {
    cd "tekore-$pkgver"
}

build() {
    cd "tekore-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "tekore-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
