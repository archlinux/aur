# Maintainer: fordprefect
# Contributor: phijor <mail [at] phijor [dot] me>

pkgname=soundcloud-dl
pkgver=2.7.5
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
makedepends=(git python-setuptools)
source=("$pkgname-$pkgver.tag.gz::https://github.com/flyingrub/scdl/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('070596f8bbaed037dd8491b89e30b458e9cae804f1adb9bb6386ef1cfb848299')

license=(GPL2)

#package() {
#  cd "$srcdir/scdl-$pkgver"
#  python setup.py install --root="$pkgdir"
#}
build() {
    cd "$srcdir/scdl-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/scdl-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
