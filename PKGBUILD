# Maintainer: AngrySoft - Sebastian Zwierzchowski

_pkgbase=sse-starlette
pkgname=python-$_pkgbase
pkgver=0.10.2
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

sha256sums=('004215b76cc9c6443010c044113d678d0ed066529a12cae1c14faf43dac7eb4e')
