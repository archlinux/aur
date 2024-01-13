# Maintainer: Giovanni Harting <539@idlegandalf.com>

pkgname=python-mpv-jsonipc
pkgver=1.2.0
pkgrel=2
pkgdesc="Python API to MPV using JSON IPC"
arch=(any)
url="https://github.com/iwalton3/python-mpv-jsonipc"
license=(GPL3)
depends=(python)
makedepends=(python-build python-installer python-wheel python-setuptools)
source=("$pkgname-$pkgver.tar.gz::https://pypi.python.org/packages/source/p/$pkgname/$pkgname-$pkgver.tar.gz")
b2sums=('5c746fc9a43638b237c5e2e470260b274e1f195cbed8593a7e523b4055b629c6015fc0d8d9d05324eff74e5ca36e51c74d7d8e2f2a236eefce5f81408cd025e9')

build() {
  cd $pkgname-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
