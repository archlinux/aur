# Maintainer: JSH <jsh 6 7 8 9 at google>
_pkgname=youtube-transcript-api
pkgname=python-youtube-transcript-api
pkgver=0.6.2
pkgrel=1
pkgdesc="A Python API which allows you to get the transcripts/subtitles for a given YouTube video."
arch=('any')
url="https://github.com/jdepoix/youtube-transcript-api"
license=('MIT')
depends=('python-requests')
makedepends=('python-setuptools')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f261ebab5cd8e859ab584508464eb384b27b7898bee8af76c9c64a489be99bcc')

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py build
}

#check() {
#    cd "$srcdir/$_pkgname-$pkgver"
#    python setup.py test
#}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}
