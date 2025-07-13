# Maintainer: Mahmoud Almezali <mzmcsmzm@gmail.com>
pkgname=torrtux
pkgver=1.0.3
pkgrel=1
pkgdesc="A Professional Multi-Source Torrent Search Tool for Command Line"
arch=('any')
url="https://github.com/almezali/torrtux-c"
license=('MIT')
depends=('python' 'python-requests' 'python-beautifulsoup4' 'python-tabulate' 'python-termcolor' 'python-tqdm')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("torrtux-c-$pkgver.tar.gz::$url/archive/refs/heads/main.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$srcdir/torrtux-c-main"
  python -m build --wheel
}

package() {
  cd "$srcdir/torrtux-c-main"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

