# Maintainer: Qontinuum <qontinuum.dev@protonmail.ch>
# Contributor: Julien Nicoulaud <julien DOT nicoulaud AT gmail DOT com>

pkgname="python-pystray"
pkgver=0.19.3
pkgrel=1
arch=('any')
license=('GPL3')
pkgdesc="Allows to create a system tray icon"
url="https://github.com/moses-palmer/pystray"
depends=('python-six' 'python-pillow' 'python-xlib>=0.17' 'libappindicator-gtk3' 'python-gobject')
makedepends=('python>=3.4' 'python-setuptools' 'python-pip' 'python-wheel')
changelog="$pkgname.changelog"
source=("$pkgname-$pkgver.tar.gz::https://github.com/moses-palmer/pystray/archive/v${pkgver}.tar.gz")
b2sums=('4fa1488efd9e0c65d4c4b9d45ad5dfb265a3dec084259064453f8018555c536e8df609c371a22e2c92ea25ab608f79760af3ec99d0f3f07840225d465a1b1172')

build() {
  cd "pystray-$pkgver"
  python setup.py build
}

package_python-pystray() {
  cd "pystray-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
