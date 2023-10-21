# Maintainer: Mario Ortiz Manero <marioortizmanero@gmail.com>
pkgname=python-tekore
pkgver=5.1.1
pkgrel=1
pkgdesc="Client for the Spotify Web API"
arch=("any")
url="https://github.com/felix-hilden/tekore"
license=("custom:MIT")
depends=("python>=3.7" "python-httpx>=0.15")
makedepends=("python-build" "python-installer" "python-wheel")
source=("https://github.com/felix-hilden/tekore/archive/v$pkgver.tar.gz")
md5sums=('12250450c0584df39513439d5e8e52f5')

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
