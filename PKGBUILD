pkgname=soundcloud-dl
pkgver=2.12.4
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
  'python-filelock'

)
makedepends=(git python-installer python-build python-wheel)
source=("$pkgname-$pkgver.tag.gz::https://github.com/flyingrub/scdl/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e75b09ee8fdb553fd7a34061023f1c33b6981e02cbd03229f693235e279d6d65')

license=(GPL-2.0-only)

build() {
    cd "$srcdir/scdl-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/scdl-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
