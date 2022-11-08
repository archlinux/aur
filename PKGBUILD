# Maintainer: Mario Ortiz Manero <marioortizmanero@gmail.com>
pkgname=python-tekore
pkgver=4.5.0
pkgrel=1
pkgdesc="Client for the Spotify Web API"
arch=("any")
url="https://github.com/felix-hilden/tekore"
license=("custom:MIT")
depends=("python>=3.7" "python-httpx>=0.15")
makedepends=("python-build" "python-installer")
source=("https://github.com/felix-hilden/tekore/archive/v$pkgver.tar.gz")
md5sums=('a02417da182d43e65ce70bc104e730bc')

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
