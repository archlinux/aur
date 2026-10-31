# Maintainer: Vladimir Tsanev <tsachev at gmail dot com>
# Python ctypes binding for libslimbook, built from upstream tag 1.27.0.
pkgname=python-slimbook
pkgver=1.27.0
pkgrel=1
pkgdesc="Python binding for libslimbook (Slimbook hardware API)"
arch=('any')
url="https://github.com/Slimbook-Team/python-slimbook"
license=('LGPL-3.0-or-later')
depends=('python' 'libslimbook')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname::git+$url.git#tag=$pkgver")
sha256sums=('SKIP')

build() {
  cd "$pkgname"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
