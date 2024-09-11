# Maintainer: tippfehlr <tippfehlr@tippfehlr.eu>

pkgname=odmpy
pkgver=0.8.1
pkgrel=1
pkgdesc="A simple command line manager for OverDrive/Libby loans."
arch=('any')
url="https://github.com/ping/odmpy"
license=('GPL-3.0-only')
depends=(
    'python' 'python-requests' 'python-eyed3' 'python-mutagen' 'python-termcolor'
    'python-tqdm' 'python-typing_extensions' 'python-lxml' 'python-iso639-lang'
    'python-beautifulsoup4'
)
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
optdepends=('ffmpeg: for audiobook merging')
source=("git+$url#tag=$pkgver")
sha512sums=('b1d9fc09a846bf96ac7f0e73636600bd592506a98e9c9cb5f0821f947778f17e791449cada7102d9c4f0c89885f87edb18351d70a7284bd580de9f1bd2ff2f27')

build() {
    cd "$pkgname"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
