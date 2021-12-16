# Maintainer: AngrySoft - Sebastian Zwierzchowski

_pkgbase=sse-starlette
pkgname=python-$_pkgbase
pkgver=0.10.0
pkgrel=1
pkgdesc="Server Sent Events for Starlette and FastAPI"
arch=('any')
url="https://github.com/sysid/sse-starlette"
license=('BSD License')
depends=('python' 'python-starlette')
makedepends=('python-setuptools')
source=("https://github.com/sysid/sse-starlette/archive/refs/tags/${pkgver}.zip")


build() {
  cd "$srcdir/$_pkgbase-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgbase-$pkgver"
  python setup.py install --skip-build -O1 --root="$pkgdir"
}

sha256sums=('09cad2b83e680b41d0ecbcc5179c297f03a2a43567d30d31bd26ae7f75297950')
