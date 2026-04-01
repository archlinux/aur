# Maintainer: kvdxsn1k <kvdxsn1k@users.noreply.github.com>
pkgname=lyrx
pkgver=0.1.0
pkgrel=1
pkgdesc="Big pixel-art lyrics in your terminal, synced to Spotify"
arch=('any')
url="https://github.com/kvdxsn1k/lyrx"
license=('MIT')
depends=('python' 'python-pillow' 'python-syncedlyrics' 'playerctl')
makedepends=('python-build' 'python-installer' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kvdxsn1k/lyrx/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
