# Maintainer: Giovanni Harting <539@idlegandalf.com>

pkgname=python-mpv-jsonipc
pkgver=1.2.0
pkgrel=3
pkgdesc='Python API to MPV using JSON IPC'
arch=(any)
url='https://github.com/iwalton3/python-mpv-jsonipc'
license=(Apache-2.0)
depends=(python)
makedepends=(python-build python-installer python-wheel python-setuptools)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('7f8c02de20e6405e7bf9b5950b240bf78e21e41d1eef52726a50181556607090e418f1775fa830de191c8af47ef78c145c37efdf213bd9255915bd34a20a86e8')

build() {
  cd $pkgname-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
