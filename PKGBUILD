# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Andrea Orru <andrea at orru dot io>
# Contributor: Andrew Rabert <ar at nullsum dot net>

pkgname=python-undervolt
pkgver=0.4.0
pkgrel=3
pkgdesc="Undervolt Intel CPUs under Linux"
url="https://github.com/georgewhewell/undervolt"
arch=('any')
license=('GPL-2.0-or-later')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
conflicts=('undervolt')
source=("$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('d7a0bbb96e6acb998b7dd05cc41f8ccd82867bba0ac6e416b6e5b60fa3a55533')

build() {
  cd undervolt-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd undervolt-$pkgver
  PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir" dist/*.whl
}
