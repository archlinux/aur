# Maintainer: Twilight0 <twilight0@vivaldi.net>
pkgname=starlette-context
pkgver=0.5.1
pkgrel=1
pkgdesc="Middleware for Starlette that allows you to store and access the context data of a request. Can be used with logging so logs automatically use request headers such as x-request-id or x-correlation-id."
arch=('any')
url="https://github.com/maerteijn/starlette-context"
license=('MIT')
depends=('python' 'python-starlette')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
source=("starlette_context-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/s/starlette-context/starlette_context-$pkgver.tar.gz")
sha256sums=('f6025753f8ede041778b2f2c3823e2da9df3c2d94832575bcb59374216b7c2b2')

build() {
  cd "$srcdir/starlette_context-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/starlette_context-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
