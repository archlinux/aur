# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

_name=FFcuesplitter
pkgname=ffcuesplitter
pkgver=1.0.31
pkgrel=1
pkgdesc='FFmpeg based audio splitter for CDDA images associated with .cue files'
url="https://github.com/jeanslack/$_name"
arch=('any')
license=(GPL-3.0)
depends=(python-charset-normalizer python-tqdm ffmpeg)
makedepends=(python-build python-installer python-wheel python-hatchling)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/jeanslack/$_name/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('761e536aeed1b5b20ae809901459071007716fbb5387f654fc4da8340457d378')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
