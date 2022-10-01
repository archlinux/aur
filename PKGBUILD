# Maintainer: Daniel Peukert <daniel@peukert.cc>
pkgname='kahlo'
pkgver='1.3.0'
pkgrel='1'
pkgdesc='Video download tool that automatically downloads newly posted videos from channels on supported websites'
arch=('any')
url="https://gitlab.com/dpeukert/$pkgname"
license=('GPL3')
depends=('python>=3.8.0' 'yt-dlp')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('32c7e96957fd1ba0ea0ba09ba5b6a0ebb3b66a6726ab33d46bdfc37c74a321611d6cd47ca4fae07187dd285ae1ed4853948c34a1ff60d9c06778b422fdf61038')

_sourcedirectory="$pkgname-$pkgver"

build() {
	cd "$srcdir/$_sourcedirectory/"
    python -m build --wheel --no-isolation
}

package() {
	cd "$srcdir/$_sourcedirectory/"
    python -m installer --destdir="$pkgdir" 'dist/'*'.whl'
}
