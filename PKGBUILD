# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Andrea Orru <andrea at orru dot io>
# Contributor: Andrew Rabert <ar at nullsum dot net>

pkgname=python-undervolt
pkgver=0.4.0
pkgrel=1
pkgdesc="Undervolt Intel CPUs under Linux"
arch=('any')
url="https://github.com/georgewhewell/undervolt"
license=('GPL')
depends=('python')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
conflicts=('undervolt')
source=("git+$url.git#tag=$pkgver")
sha256sums=('SKIP')

build() {
  cd undervolt
  python -m build --wheel --no-isolation
}

package() {
  cd undervolt
  PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir" dist/*.whl
}
