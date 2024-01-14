# Maintainer: Giovanni Harting <539@idlegandalf.com>
# Contributor: Qontinuum <qontinuum.dev@protonmail.ch>
# Contributor: Julien Nicoulaud <julien DOT nicoulaud AT gmail DOT com>

pkgname=python-pystray
pkgver=0.19.5
pkgrel=2
arch=(any)
license=(GPL3)
pkgdesc="Allows to create a system tray icon"
url="https://github.com/moses-palmer/pystray"
depends=(python-six python-pillow 'python-xlib>=0.17' libappindicator-gtk3 python-gobject)
makedepends=(python-build python-installer python-wheel python-setuptools python-sphinx)
source=("$pkgname-$pkgver.tar.gz::https://github.com/moses-palmer/pystray/archive/v${pkgver}.tar.gz")
b2sums=('34bea3d14cfde7ee7a7d2594da2386265fba34b36f4699b5877ea393dbf7e844fe441a1bda384bb6b3f279a544cba897e04509f7c47d69cb5168793665ae73d4')

build() {
  cd "pystray-$pkgver"
  python -m build --wheel --no-isolation
}

package_python-pystray() {
  cd "pystray-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
