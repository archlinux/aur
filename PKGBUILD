# Maintainer: JSH <jsh6789 at google>
_pkgname=youtube-transcript-api
pkgname=python-youtube-transcript-api
pkgver=1.2.4
pkgrel=1
pkgdesc="A Python API which allows you to get the transcripts/subtitles for a given YouTube video."
arch=('any')
url="https://github.com/jdepoix/youtube-transcript-api"
license=('MIT')
depends=('python-requests' 'python-defusedxml')
makedepends=('python-build' 'python-installer' 'python-poetry-core' 'python-wheel')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('46651063ec4104421d7b7855e3b677025e2efb0749a20e7139f83dd48f5c6c77')

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
