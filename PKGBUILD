# Maintainer: Mahmoud Almezali <mzmcsmzm@gmail.com>
pkgname=torrench-v
pkgver=1.0.0
pkgrel=1
pkgdesc="A powerful multi-site torrent search tool that searches across multiple torrent sites from the command line"
arch=('any')
url="https://github.com/almezali/enhanced-torrench"
license=('MIT')
depends=('python' 'python-requests' 'python-beautifulsoup4' 'python-lxml' 'python-tabulate' 'python-termcolor')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=(
    "$pkgname-$pkgver.tar.gz::$url/archive/refs/heads/main.tar.gz"
)
sha256sums=('SKIP') 

build() {
  cd "enhanced-torrench-main"
  python -m build --wheel
}

package() {
  cd "enhanced-torrench-main"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

