# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

_name=FFcuesplitter
pkgname=ffcuesplitter
pkgver=1.0.32
pkgrel=1
pkgdesc='FFmpeg based audio splitter for CDDA images associated with .cue files'
url="https://github.com/jeanslack/$_name"
arch=('any')
license=(GPL-3.0)
depends=(python-charset-normalizer python-tqdm ffmpeg)
makedepends=(python-build python-installer python-wheel python-hatchling)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/jeanslack/$_name/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('41c9b026811b09058cbf9afd0cb69ce768ccd9ff4c9b4f98bc3b67ca378afcd1')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
