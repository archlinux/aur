pkgname=soundcloud-dl
pkgver=2.11.4
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
)
makedepends=(git python-installer python-build python-wheel)
source=("$pkgname-$pkgver.tag.gz::https://github.com/flyingrub/scdl/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d059d5ad0b53944c635c4811a4eacfbac118ccc8a2a76435836cfdb06160cd88')

license=(GPL-2.0-only)

build() {
    cd "$srcdir/scdl-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/scdl-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
