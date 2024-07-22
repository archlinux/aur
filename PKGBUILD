pkgname=soundcloud-dl
pkgver=2.11.2
pkgrel=1
pkgdesc="Souncloud music downloader"
url="https://github.com/flyingrub/scdl"
arch=(any)
depends=(
  'python-clint'
  'python-docopt'
  'python-mutagen'
  'python-termcolor'
  'python-requests'
  'python-pathvalidate'
  'python-soundcloud-v2'
  'python-build'
  'python-wheel'
  'python-installer'
)
makedepends=(git python-setuptools)
source=("$pkgname-$pkgver.tag.gz::https://github.com/flyingrub/scdl/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b2a4b5459f412be6056d0d4a1c10e67288824fcb5a5582aa4f86b3d5a1c80bbd')

license=(GPL-2.0-only)

build() {
    cd "$srcdir/scdl-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/scdl-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
