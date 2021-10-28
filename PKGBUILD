# Maintainer: AngrySoft - Sebastian Zwierzchowski

_pkgbase=sse-starlette
pkgname=python-$_pkgbase
pkgver=0.9.0
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

sha256sums=('9a33b0c298591ba8c92b4c1a3009b6a478416dea489fa98d91ae18d50f68c647')
