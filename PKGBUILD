# Maintainer: JSH <jsh6789 at google>
_pkgname=youtube-transcript-api
pkgname=python-youtube-transcript-api
pkgver=1.2.0
pkgrel=1
pkgdesc="A Python API which allows you to get the transcripts/subtitles for a given YouTube video."
arch=('any')
url="https://github.com/jdepoix/youtube-transcript-api"
license=('MIT')
depends=('python-requests' 'python-defusedxml')
makedepends=('python-build' 'python-installer' 'python-poetry-core' 'python-wheel')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0fc8f3f68ebc4a07b2558f541842057b96e3c672c3e275b93f857dad9f0f26b7')

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
