# Maintainer: Qontinuum <qontinuum.dev@protonmail.ch>
# Contributor: Julien Nicoulaud <julien DOT nicoulaud AT gmail DOT com>

pkgname="python-pystray"
pkgver=0.17.4
pkgrel=1
arch=('any')
license=('GPL3')
pkgdesc="Allows to create a system tray icon"
url="https://github.com/moses-palmer/pystray"
depends=('python-six' 'python-pillow' 'python-xlib>=0.17' 'libappindicator-gtk3' 'python-gobject')
makedepends=('python>=3.4' 'python-setuptools' 'python-pip' 'python-wheel')
changelog="$pkgname.changelog"
source=("$pkgname-$pkgver.tar.gz::https://github.com/moses-palmer/pystray/archive/v${pkgver}.tar.gz")
b2sums=('2be8d038afb35c0ecc6a0879a41bf898ef8ecf1f5e6d8e9c6d23a157714b866ec7a19d2e5205e95d5c16d0f401e360fb3fa4cdef1f4ed7779436be3e1a4fd37f')

build() {
  cd "pystray-$pkgver"
  python setup.py build
}

package_python-pystray() {
  cd "pystray-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
