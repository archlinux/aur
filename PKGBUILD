# Maintainer: JSH <jsh6789 at google>
_pkgname=youtube-transcript-api
pkgname=python-youtube-transcript-api
pkgver=1.2.2
pkgrel=1
pkgdesc="A Python API which allows you to get the transcripts/subtitles for a given YouTube video."
arch=('any')
url="https://github.com/jdepoix/youtube-transcript-api"
license=('MIT')
depends=('python-requests' 'python-defusedxml')
makedepends=('python-build' 'python-installer' 'python-poetry-core' 'python-wheel')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('dc34c73ef319915efa10d26c02203ec48ebae95d9ffc7ab8bdf9362c537a739e')

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
