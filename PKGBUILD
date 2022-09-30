# Maintainer: Daniel Peukert <daniel@peukert.cc>
pkgname='kahlo'
pkgver='1.2.0'
pkgrel='1'
pkgdesc='Video download tool that automatically downloads newly posted videos from channels on supported websites'
arch=('any')
url="https://gitlab.com/dpeukert/$pkgname"
license=('GPL3')
depends=('python>=3.8.0' 'yt-dlp')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('63173e9ebaad5c2ad735a5ba9cc7b53e883a750976d2aad14d22ea77d10da1295ea0aed6c0a456ec793406a10c74b86431ec322be345ed1727854d63f77ecba3')

_sourcedirectory="$pkgname-$pkgver"

build() {
	cd "$srcdir/$_sourcedirectory/"
    python -m build --wheel --no-isolation
}

package() {
	cd "$srcdir/$_sourcedirectory/"
    python -m installer --destdir="$pkgdir" 'dist/'*'.whl'
}
