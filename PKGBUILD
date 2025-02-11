# Maintainer: Kumi <hostsd@kumi.email>
pkgname=hostsd
pkgver=0.1.3
pkgrel=1
pkgdesc="A simple hosts file manager"
arch=('any')
url="https://git.private.coffee/kumi/hostsd"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
source=("https://git.private.coffee/kumi/hostsd/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

