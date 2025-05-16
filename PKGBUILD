# Maintainer: JSH <jsh6789 at google>
_pkgname=youtube-transcript-api
pkgname=python-youtube-transcript-api
pkgver=1.0.3
pkgrel=1
pkgdesc="A Python API which allows you to get the transcripts/subtitles for a given YouTube video."
arch=('any')
url="https://github.com/jdepoix/youtube-transcript-api"
license=('MIT')
depends=('python-requests' 'python-defusedxml')
makedepends=('python-build' 'python-installer' 'python-poetry-core' 'python-wheel')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5961bd5ad894ab3f52d45ddf40adce794be83a27c449e0d801b01a8b4d4307ef')

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
