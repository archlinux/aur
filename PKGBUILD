# Maintainer: AngrySoft - Sebastian Zwierzchowski

_pkgbase=sse-starlette
pkgname=python-$_pkgbase
pkgver=0.7.2
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

sha256sums=('c167d308ab0465ca22f3ceff2d68662fcf2d7304fac5c8f1c556301f3eb79c26')
